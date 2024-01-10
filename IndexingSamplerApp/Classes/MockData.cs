using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IndexingSamplerApp.Models;

namespace IndexingSamplerApp.Classes;
internal class MockData
{
    public static List<Person> People => new()
    {
        new Person() { Id = 1, FirstName = "Stefanie", LastName = "Buckley", EmailAddress = "Buckley1@bxcwtl.org", SitePassword = "1VDV3ZIFZ5QSZM5J52" },
        new Person() { Id = 2, FirstName = "Sandy", LastName = "Mc Gee", EmailAddress = "Gee22@rxmkwq.net", SitePassword = "IXND9H" },
        new Person() { Id = 3, FirstName = "Lee", LastName = "Warren", EmailAddress = "Lee7@cusfu.brsovb.org", SitePassword = "WK20MQ" },
        new Person() { Id = 4, FirstName = "Regina", LastName = "Forbes", EmailAddress = "qiekszc.txpoca@tflkg.rsetzb.net", SitePassword = "F6BQU6" },
        new Person() { Id = 5, FirstName = "Daniel", LastName = "Kim", EmailAddress = "nfds20@ldyif.-qpucw.net", SitePassword = "#09KoP" },
        new Person() { Id = 6, FirstName = "Dennis", LastName = "Nunez", EmailAddress = "Nunez156@ikjvwn.net", SitePassword = "!2GLXUI" },
        new Person() { Id = 7, FirstName = "Myra", LastName = "Zuniga", EmailAddress = "tzdajoot1@kfiuto.com", SitePassword = "@EWeek!End" },
        new Person() { Id = 8, FirstName = "Teddy", LastName = "Ingram", EmailAddress = "pwlf.fqvth@byfic.xmtanx.net", SitePassword = "!Gazin!Q" },
        new Person() { Id = 9, FirstName = "Annie", LastName = "Larson", EmailAddress = "Larson@kyihcl.com", SitePassword = "!FiOQp_o" }
    };

    public static Person[] PeopleArray() => People.ToArray();
}
