# Data provider vs EF Core

:house:  [back home](readme.md)

Although there are reasons for picking data provider over EF Core and vis-versa but unless the reason is compelling and will have changes down the road database wise consider using Entity Framework.

With conventional data provider we must setup connections, connection strings or configuring a DataAdaper were there is a chance the column names in tables may change and or their data type may change which means a developer must make manual changes. If you go this route consider creating SQL statements in SSMS (SQL-Server Management Studio), test them then create a class for storing the SQL statements are done in the project CustomerDatabaseLibrary under Classes, SqlStatements1.

For EF Core one simply reverse engineers the database although when doing this any customization can be lost but can be handled with using partial classes.

Suppose we want all records and child data using a data provider

SQL statement to read all customers

```sql
SELECT C.Identifier, 
       C.CompanyName, 
       C.ContactName, 
       C.ContactTypeIdentifier, 
       C.GenderIdentifier
FROM Customer AS C
     INNER JOIN Genders AS G ON C.GenderIdentifier = G.id
     INNER JOIN ContactTypes AS CT ON C.ContactTypeIdentifier = CT.Identifier;
```

Code to read all customers

```csharp
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
```

Now lets look at a mirror image of the above with EF Core.

```csharp
public static List<Customer> Customers()
{
    using var context = new CustomerContext();
    return context.Customer
        .Include(x => x.ContactTypeIdentifierNavigation)
        .Include(x => x.GenderIdentifierNavigation)
        .ToList();
}
```

- context.Customer indicates to read the Customer table
- `Include(x => x.ContactTypeIdentifierNavigation)` reads the contact type for each Customer
- `Include(x => x.GenderIdentifierNavigation)` gets the gender for the Customer contact type
- `ToList()` runs the query

Later on we will show how to [deferred query execution](https://docs.microsoft.com/en-us/dotnet/framework/data/adonet/ef/language-reference/query-execution#deferred-query-execution) of the query with EF Core.

**Deferred query execution**

>Execution of the query is deferred until the query variable is iterated over in a foreach or For Each loop. This is known as deferred execution; that is, query execution occurs some time after the query is constructed. 

:house:  [back home](readme.md)