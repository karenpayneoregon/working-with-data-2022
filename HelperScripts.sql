---SELECT Identifier, CompanyName, ContactName, ContactTypeIdentifier, GenderIdentifier FROM CustomerDatabase.dbo.Customer;

---DELETE FROM CustomerDatabase.dbo.Customer;

---DBCC CHECKIDENT('[Customer]', RESEED, 0);




					SELECT   T.name AS TableName, SI.rows AS NumberOfRows
					FROM     sys.tables AS T INNER JOIN sys.sysindexes AS SI ON T.object_id = SI.id
					WHERE    (SI.indid IN (0, 1)) AND T.name <> 'sysdiagrams'
					ORDER BY NumberOfRows DESC, TableName




