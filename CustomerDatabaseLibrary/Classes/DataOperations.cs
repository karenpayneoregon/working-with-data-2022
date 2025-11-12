using System.Collections.Immutable;
using System.Data;
using CustomerDatabaseLibrary.Models;
using ConfigurationLibrary.Classes;
using DbLibrary.LanguageExtensions;
using SqlCoreUtilityLibrary.Classes;
using Dapper;
using Microsoft.Data.SqlClient;

namespace CustomerDatabaseLibrary.Classes
{
    /// <summary>
    /// 
    /// </summary>
    /// <remarks>
    /// * The majority of code has no exception handling to keep code clear.
    ///   For a real application it's recommended to trap for errors and
    ///   log to a file, database table or a combination.
    ///
    /// * Compare this code to EF Core code and find
    ///     * More code is required
    ///     * More chances of errors e.g. rename and column in a table and not here
    ///       here misspell something and an exception will be thrown.
    /// </remarks>
    public class DataOperations
    {
        /// <summary>
        /// Read all records in the gender table
        /// </summary>
        public static IReadOnlyList<Genders> GendersList()
        {
            List<Genders> list = new(); 

            using var cn = new SqlConnection(ConfigurationHelper.ConnectionString());
            using var cmd = new SqlCommand { Connection = cn, CommandText = SqlStatements1.GetGenders };

            cn.Open();
            var reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                list.Add(new Genders() {id = reader.GetInt32(0), GenderType = reader.GetString(1) });
            }

            return list.ToImmutableList();
        }



        /// <summary>
        /// Read all Contact types in the database
        /// </summary>
        public static IReadOnlyList<ContactTypes> ContactTypesList()
        {
            List<ContactTypes> list = new();

            using var cn = new SqlConnection(ConfigurationHelper.ConnectionString());
            using var cmd = new SqlCommand { Connection = cn, CommandText = SqlStatements1.GetContactTypes };

            cn.Open();
            var reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                list.Add(new ContactTypes() { Identifier = reader.GetInt32(0), ContactType = reader.GetString(1) });
            }

            return list.ToImmutableList();
        }
        
        public static IReadOnlyList<ContactTypes> ContactTypesListDapper(params int[] identifiers)
        {
            using var cn = new SqlConnection(ConfigurationHelper.ConnectionString());
            return cn.Query<ContactTypes>(SqlStatements1.GetContactTypesWhereIn, new { Identifiers = identifiers }).ToImmutableList();
        }

        /// <summary>
        /// Read all Customers in the database
        /// </summary>
        public static List<Customer> Customers()
        {
            List<Customer> list = new();

            using var cn = new SqlConnection(ConfigurationHelper.ConnectionString());
            using var cmd = new SqlCommand { Connection = cn, CommandText = SqlStatements1.GetCustomers };

            cn.Open();
            var reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                list.Add(new Customer()
                {
                    Identifier = reader.GetInt32(0), 
                    CompanyName = reader.GetString(1), 
                    ContactName = reader.GetString(2), 
                    ContactTypeIdentifier = reader.GetInt32(3),
                    GenderIdentifier = reader.GetInt32(4)
                });
            }

            return list;
        }

        /// <summary>
        /// Get a Customer by primary key
        /// </summary>
        /// <param name="identifier">Primary key</param>
        /// <returns>Found Customer or null</returns>
        public static Customer CustomerByIdentifier(int identifier)
        {
            
            using var cn = new SqlConnection(ConfigurationHelper.ConnectionString());
            using var cmd = new SqlCommand { Connection = cn, CommandText = SqlStatements1.GetCustomerByIdentifier };

            // Many use AddWithValue, please avoid as it sometimes gets things wrong especially with dates
            cmd.Parameters.Add("@Identifier", SqlDbType.Int).Value = identifier;

            cn.Open();

            var reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                reader.Read();
                Customer customer = new()
                {
                    Identifier = reader.GetInt32(0),
                    CompanyName = reader.GetString(1),
                    ContactName = reader.GetString(2),
                    ContactTypeIdentifier = reader.GetInt32(3),
                    GenderIdentifier = reader.GetInt32(4)
                };

                return customer;
            }
            else
            {
                return null;
            }

            
        }

        /// <summary>
        /// Add new customer with no error checking
        ///
        /// When working with queries that have values set we need to add them
        /// with Command.Parameters.Add and set the data type.
        ///
        /// Many new developers will use Command.Parameters.AddWithValue which
        /// means the runtime compiler must guess at the data type which can go wrong
        /// especially when working with date types so stick with Command.Parameters.Add
        /// </summary>
        /// <param name="customer"><see cref="Customer"/>Customer to insert</param>
        public static void AddCustomer(Customer customer)
        {

            using var cn = new SqlConnection(ConfigurationHelper.ConnectionString());
            // insert new record, get new primary key
            using var cmd = new SqlCommand { Connection = cn, CommandText = SqlStatements1.AddNewCustomer};
            
            cmd.Parameters.Add("@CompanyName", SqlDbType.NChar).Value = customer.CompanyName;
            cmd.Parameters.Add("@ContactName", SqlDbType.NChar).Value = customer.ContactName;
            cmd.Parameters.Add("@ContactTypeIdentifier", SqlDbType.Int).Value = customer.ContactTypeIdentifier;
            cmd.Parameters.Add("@GenderIdentifier", SqlDbType.Int).Value = customer.GenderIdentifier;
            
            cn.Open();
            customer.Identifier = Convert.ToInt32(cmd.ExecuteScalar());
        }

        /// <summary>
        /// Same as above with exception handling added
        /// </summary>
        /// <param name="customer"><see cref="Customer"/>Customer to insert</param>
        /// <returns>success of operation and if an error the exception object</returns>
        public static (bool success, Exception exception) InsertCustomer(Customer customer)
        {

            using var cn = new SqlConnection(ConfigurationHelper.ConnectionString());
            using var cmd = new SqlCommand { Connection = cn, CommandText = SqlStatements1.AddNewCustomer };

            cmd.Parameters.Add("@CompanyName", SqlDbType.NChar).Value = customer.CompanyName;
            cmd.Parameters.Add("@ContactName", SqlDbType.NChar).Value = customer.ContactName;
            cmd.Parameters.Add("@ContactTypeIdentifier", SqlDbType.Int).Value = customer.ContactTypeIdentifier;
            cmd.Parameters.Add("@GenderIdentifier", SqlDbType.Int).Value = customer.GenderIdentifier;

            try
            {
                cn.Open();
                customer.Identifier = Convert.ToInt32(cmd.ExecuteScalar());
                return (true, null);
            }
            catch (Exception localException)
            {
                return (false, localException);
            }

        }
        /// <summary>
        /// Add more than one Customer record
        /// 
        /// When working with queries that have values set we need to add them
        /// with Command.Parameters.Add and set the data type.
        ///
        /// Many new developers will use Command.Parameters.AddWithValue which
        /// means the runtime compiler must guess at the data type which can go wrong
        /// especially when working with date types so stick with Command.Parameters.Add
        /// </summary>
        /// <param name="list">One or more customers to add</param>
        /// <remarks>
        /// Each customer successfully added will have the primary key set.
        /// </remarks>
        public static void AddCustomers(List<Customer> list)
        {
            using var cn = new SqlConnection(ConfigurationHelper.ConnectionString());
            using var cmd = new SqlCommand { Connection = cn, CommandText = SqlStatements1.AddNewCustomer };

            cmd.Parameters.Add("@CompanyName", SqlDbType.NChar);
            cmd.Parameters.Add("@ContactName", SqlDbType.NChar);
            cmd.Parameters.Add("@ContactTypeIdentifier", SqlDbType.Int);
            cmd.Parameters.Add("@GenderIdentifier", SqlDbType.Int);

            cn.Open();

            foreach (var customer in list)
            {
                cmd.Parameters["@CompanyName"].Value = customer.CompanyName;
                cmd.Parameters["@ContactName"].Value = customer.ContactName;
                cmd.Parameters["@ContactTypeIdentifier"].Value = customer.ContactTypeIdentifier;
                cmd.Parameters["@GenderIdentifier"].Value = customer.GenderIdentifier;
                customer.Identifier = Convert.ToInt32(cmd.ExecuteScalar());
            }
        }

        public static int EditCustomer(Customer customer)
        {
            using var cn = new SqlConnection(ConfigurationHelper.ConnectionString());
            using var cmd = new SqlCommand { Connection = cn, CommandText = SqlStatements1.UpdateCustomer};

            cmd.Parameters.Add("@CompanyName", SqlDbType.NChar).Value = customer.CompanyName;
            cmd.Parameters.Add("@ContactName", SqlDbType.NChar).Value = customer.ContactName;
            cmd.Parameters.Add("@ContactTypeIdentifier", SqlDbType.Int).Value = customer.ContactTypeIdentifier;
            cmd.Parameters.Add("@GenderIdentifier", SqlDbType.Int).Value = customer.GenderIdentifier;
            cmd.Parameters.Add("@Identifier", SqlDbType.Int).Value = customer.Identifier;

            cn.Open();

            return cmd.ExecuteNonQuery();

        }

        public static (bool success, Exception exception) RemoveCustomer(Customer customer)
        {
            using var cn = new SqlConnection(ConfigurationHelper.ConnectionString());
            using var cmd = new SqlCommand
            {
                Connection = cn, 
                CommandText = SqlStatements1.RemoveCustomer
            };

            try
            {
                cn.Open();
                cmd.Parameters.Add("@Identifier", SqlDbType.Int).Value = customer.Identifier;
                cmd.ExecuteNonQuery();
                return (true, null);
            }
            catch (Exception localException)
            {
                return (false, localException);
            }

        }

        /// <summary>
        /// for article purposes only
        /// </summary>
        /// <param name="pList"></param>
        /// <returns></returns>
        /// <remarks>
        /// See full examples here
        /// https://github.com/karenpayneoregon/dyynamic-sql-where-in
        /// </remarks>
        public static string GetCustomersNamesBack(List<int> pList)
        {
            using var cn = new SqlConnection(ConfigurationHelper.ConnectionString());
            using var cmd = new SqlCommand { Connection = cn };

            cmd.CommandText = SqlWhereInParamBuilder
                .BuildInClause("SELECT CompanyName FROM dbo.Customer WHERE Identifier IN ({0})", "Identifier",
                    pList);

            cmd.AddParamsToCommand("Identifier", pList);
            return cmd.ActualCommandText();
        }

        public static async Task<List<Customer>> CustomersWhereInAsync(int[] primaryKeys)
        {
            List<Customer> list = new List<Customer>();

            await using var cn = new SqlConnection(ConfigurationHelper.ConnectionString());
            await using var cmd = new SqlCommand { Connection = cn };

            cmd.CommandText = SqlWhereInParamBuilder
                .BuildInClause(SqlStatements1.GetCustomerByMultipleIdentifiers, "Identifier",
                    primaryKeys);

            cmd.AddParamsToCommand("Identifier", primaryKeys);

            await cn.OpenAsync();

            var reader = await cmd.ExecuteReaderAsync();

            if (!reader.HasRows) return list;
            while (reader.Read())
            {
                list.Add(new Customer()
                {
                    Identifier = reader.GetInt32(0), 
                    CompanyName = reader.GetString(1), 
                    ContactName = reader.GetString(2), 
                    ContactTypeIdentifier = reader.GetInt32(3), 
                    GenderIdentifier = reader.GetInt32(4)
                });
            }

            return list;
        }


    }
}
