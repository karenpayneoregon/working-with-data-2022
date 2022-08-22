using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;

namespace DataUnitTestProject.Classes
{
    /// <summary>
    /// For unit test
    /// </summary>
    public static class BogusHelpers
    {
        public static void Dump(this object sender)
        {
            Console.WriteLine(sender.DumpString());
        }

        public static string DumpString(this object sender)
        {
            var json = JsonSerializer.Serialize(sender, new JsonSerializerOptions()
            {
                WriteIndented = true
            });

            return json;
        }

    }
}
