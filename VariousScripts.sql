/****** CustomeDatabase2  ******/


SELECT Cust.CustomerIdentifier, 
       Cust.CompanyName, 
       Cust.ContactId, 
       Cust.Street, 
       Cust.City, 
       Cust.PostalCode, 
       Cust.CountryIdentifier, 
       Cust.Phone, 
       Cust.ContactTypeIdentifier, 
       Cust.ModifiedDate, 
       C.FirstName, 
       C.LastName, 
       CT.ContactTitle, 
       G.GenderType
FROM Customers AS Cust
     INNER JOIN Contacts AS C ON Cust.ContactId = C.ContactId
     INNER JOIN ContactType AS CT ON Cust.ContactTypeIdentifier = CT.ContactTypeIdentifier AND C.ContactTypeIdentifier = CT.ContactTypeIdentifier
     INNER JOIN Genders AS G ON C.GenderIdentifier = G.GenderIdentifier;

-------------------------------------------------------------------------------------

SELECT C.ContactId, 
       C.FirstName, 
       C.LastName, 
       C.ContactTypeIdentifier, 
       C.GenderIdentifier, 
       G.GenderType
FROM Contacts AS C
     INNER JOIN Genders AS G ON C.GenderIdentifier = G.GenderIdentifier;


-------------------------------------------------------------------------------------

SELECT-1 AS CountryIdentifier, 
      'Select' AS [Name]
UNION ALL
SELECT CountryIdentifier, 
       [Name]
FROM 
    dbo.Countries;

-------------------------------------------------------------------------------------


SELECT-1 AS GenderIdentifier, 
      'Select' AS GenderType
UNION ALL
SELECT GenderIdentifier, 
       GenderType
FROM dbo.Genders;

-------------------------------------------------------------------------------------

DECLARE @CustomerIdentifier INT= 7;

SELECT Cust.CustomerIdentifier, 
       Cust.CompanyName, 
       Cust.ContactTypeIdentifier, 
       Cust.ModifiedDate, 
       G.GenderType, 
       C.FirstName, 
       C.LastName, 
       CT.ContactTitle, 
       Countries.Name, 
       Cust.CountryIdentifier, 
       Cust.ContactId
FROM Customers AS Cust
     INNER JOIN Contacts AS C ON Cust.ContactId = C.ContactId
     INNER JOIN ContactType AS CT ON Cust.ContactTypeIdentifier = CT.ContactTypeIdentifier
                                     AND C.ContactTypeIdentifier = CT.ContactTypeIdentifier
     INNER JOIN Genders AS G ON C.GenderIdentifier = G.GenderIdentifier
     INNER JOIN Countries ON Cust.CountryIdentifier = Countries.CountryIdentifier
WHERE Cust.CustomerIdentifier = @CustomerIdentifier;


DECLARE @ModifiedDate date     = '2020-04-24'

SELECT Cust.CustomerIdentifier, 
       Cust.CompanyName, 
       Cust.ContactTypeIdentifier, 
       Cust.ModifiedDate, 
       G.GenderType, 
       C.FirstName, 
       C.LastName, 
       CT.ContactTitle, 
       Countries.Name, 
       Cust.CountryIdentifier, 
       Cust.ContactId
FROM Customers AS Cust
     INNER JOIN Contacts AS C ON Cust.ContactId = C.ContactId
     INNER JOIN ContactType AS CT ON Cust.ContactTypeIdentifier = CT.ContactTypeIdentifier
                                     AND C.ContactTypeIdentifier = CT.ContactTypeIdentifier
     INNER JOIN Genders AS G ON C.GenderIdentifier = G.GenderIdentifier
     INNER JOIN Countries ON Cust.CountryIdentifier = Countries.CountryIdentifier
WHERE CAST(ModifiedDate AS DATE) = @ModifiedDate