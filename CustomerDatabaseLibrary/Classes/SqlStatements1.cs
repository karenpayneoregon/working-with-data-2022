namespace CustomerDatabaseLibrary.Classes
{
    public class SqlStatements1
    {
        /// <summary>
        /// Used to get all Gender records
        /// </summary>
        public static string GetGenders => 
            "SELECT id, GenderType FROM dbo.Genders;";

        /// <summary>
        /// Used to get all Gender records, insert a Select option at first position
        /// </summary>
        public static string GetGendersWithSelect => 
            "SELECT -1 AS Id, 'Select' AS GenderType UNION ALL SELECT Id, GenderType FROM dbo.Genders;";

        /// <summary>
        /// Get all ContactType records
        /// </summary>
        public static string GetContactTypes => 
            "SELECT Identifier, ContactType FROM dbo.ContactTypes;";

        /// <summary>
        /// Used to get all ContactType records, insert a Select option at first position
        /// </summary>
        public static string GetContactTypesWithSelect => 
            "SELECT -1 AS Identifier, 'Select' AS ContactType UNION ALL SELECT Identifier, ContactType FROM dbo.ContactTypes;";

        /// <summary>
        /// Get all Customer records with Gender and ContactType joins
        /// </summary>
        public static string GetCustomers => 
            @"SELECT C.Identifier, C.CompanyName, C.ContactName, C.ContactTypeIdentifier, C.GenderIdentifier
              FROM   Customer AS C INNER JOIN  Genders AS G ON C.GenderIdentifier = G.id INNER JOIN ContactTypes AS CT ON C.ContactTypeIdentifier = CT.Identifier";

        /// <summary>
        /// Get Customer record with Gender and ContactType joins by customer primary key
        /// </summary>
        public static string GetCustomerByIdentifier => 
            @"SELECT  C.Identifier, C.CompanyName, C.ContactName, C.ContactTypeIdentifier, C.GenderIdentifier
              FROM    Customer AS C INNER JOIN  Genders AS G ON C.GenderIdentifier = G.id INNER JOIN ContactTypes AS CT ON C.ContactTypeIdentifier = CT.Identifier
              WHERE   C.Identifier = @Identifier";

        /// <summary>
        /// Get Customer records with Gender and ContactType joins by multiple customer primary keys
        /// </summary>
        public static string GetCustomerByMultipleIdentifiers =>
            @"SELECT  C.Identifier, C.CompanyName, C.ContactName, C.ContactTypeIdentifier, C.GenderIdentifier
              FROM    Customer AS C INNER JOIN  Genders AS G ON C.GenderIdentifier = G.id INNER JOIN ContactTypes AS CT ON C.ContactTypeIdentifier = CT.Identifier
              WHERE   C.Identifier IN ({0})";

        /// <summary>
        /// For inserting a new customer record, returns new primary key
        /// </summary>
        public static string AddNewCustomer =>
            @"INSERT INTO dbo.Customer (CompanyName,ContactName,ContactTypeIdentifier,GenderIdentifier) 
              VALUES (@CompanyName,@ContactName,@ContactTypeIdentifier,@GenderIdentifier);
              SELECT CAST(scope_identity() AS int);";


        /// <summary>
        /// For removal of a customer by primary key
        /// </summary>
        public static string RemoveCustomer => "DELETE FROM dbo.Customer WHERE Identifier = @Identifier;";

        /// <summary>
        /// Update a customer record by primary key
        /// </summary>
        public static string UpdateCustomer =>
            @"UPDATE Customer SET CompanyName = @CompanyName, 
              ContactName = @ContactName,ContactTypeIdentifier = @ContactTypeIdentifier,
              GenderIdentifier = @GenderIdentifier WHERE Identifier = @Identifier";
    }
}
