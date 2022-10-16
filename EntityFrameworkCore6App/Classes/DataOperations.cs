using EntityCoreExtensions;

namespace EntityFrameworkCore6App.Classes
{
    internal class DataOperations
    {
        public static List<Customer> CustomersWithIncludes()
        {
            using var context = new Context();
            return context.Customer
                .Include(x => x.ContactTypeIdentifierNavigation)
                .Include(x => x.GenderIdentifierNavigation)
                .ToList();
        }

        public static List<Customer> SortByString()
        {
            using var context = new Context();
            return 
                context.Customer.SortColumn("CompanyName",
                    GenericSorterExtension.SortDirection.Descending).ToList();
        }
    }
}
