using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataUnitTestProject.Classes
{
    public class SqlStatements
    {
        public static string AllTablesHaveRecords => "SELECT T.name TableName,i.Rows NumberOfRows FROM sys.tables T JOIN sys.sysindexes I ON T.OBJECT_ID = I.ID WHERE indid IN (0,1) ORDER BY i.Rows DESC,T.name";
    }
}
