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
    }
}
