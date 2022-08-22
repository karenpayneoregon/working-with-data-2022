using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ConfigurationLibrary.Classes;
using CustomerDatabaseLibraryEntityFramework.Data;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Storage;

namespace DataUnitTestProject.Classes
{
    public class VerificationOperations
    {
        /// <summary>
        /// Get last primary key for Customer table which is used to validate after
        /// a new record is added via SqlClient or EF Core
        /// </summary>
        /// <returns>Last Customer primary key</returns>
        /// <remarks>
        /// Intended for unit testing only
        /// </remarks>
        public static int LastCustomerIdentifier()
        {
            using var cn = new SqlConnection(ConfigurationHelper.ConnectionString());
            using var cmd = new SqlCommand
            {
                Connection = cn, 
                CommandText = "SELECT Identifier FROM Customer WHERE Identifier = (SELECT MAX(Identifier) FROM Customer)"
            };

            cn.Open();

            return Convert.ToInt32(cmd.ExecuteScalar());
        }

        public static int CustomersRecordCount()
        {
            using var cn = new SqlConnection(ConfigurationHelper.ConnectionString());
            using var cmd = new SqlCommand
            {
                Connection = cn,
                CommandText = "SELECT COUNT(*) FROM dbo.Customer;"
            };

            cn.Open();
            return Convert.ToInt32(cmd.ExecuteScalar());
        }

        /// <summary>
        /// Determine if all tables have records
        /// </summary>
        /// <returns></returns>
        public static bool TablesArePopulated()
        {
            using var cn = new SqlConnection(ConfigurationHelper.ConnectionString());
            using var cmd = new SqlCommand(SqlStatements.AllTablesHaveRecords, cn);

            DataTable table = new();
            cn.Open();

            table.Load(cmd.ExecuteReader());
            return table.AsEnumerable()
                .All(row => row.Field<int>("NumberOfRows") > 0);

        }

        public static async Task<bool> DatabaseExistsAsync()
        {
            await using var context = new CustomerContext();
            return await ((context.GetService<IDatabaseCreator>() as RelationalDatabaseCreator)!).ExistsAsync();
        }
    }
}
