using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using ConfigurationLibrary.Classes;
using CustomerDatabaseLibrary.Classes;
using CustomerDatabaseLibrary.Models;
using Microsoft.Data.SqlClient;

namespace DataUnitTestProject.Base
{
    public class DataHelpers
    {
        /// <summary>
        /// Restore customers to original state
        /// </summary>
        public static void ResetCustomerTable()
        {
            using var cn = new SqlConnection(ConfigurationHelper.ConnectionString());
            using var cmd = new SqlCommand
            {
                Connection = cn,
                CommandText = "DELETE FROM dbo.Customer;"
            };

            cn.Open();
            cmd.ExecuteNonQuery();
            cn.Close();
            cmd.CommandText = "DBCC CHECKIDENT('[Customer]', RESEED, 0);";
            cn.Open();
            cmd.ExecuteNonQuery();

            List<Customer> customers = JsonSerializer.Deserialize<List<Customer>>
                (File.ReadAllText("Customers.json"));

            DataOperations.AddCustomers(customers);

        }
    }
}
