using EntityFrameworkCore6App.Classes;
using Spectre.Console;


namespace EntityFrameworkCore6App;

internal class Program
{
    static void Main(string[] args)
    {
        
        AnsiConsole.MarkupLine("[yellow]Reading data...[/]");
        var table = SpectreConsoleHelpers.CreateTable();

        List<Customer> customers = DataOperations.CustomersWithIncludes();

        for (var index = 0; index < customers.Count; index++)
        {
            var customer = customers[index];

            if (index.IsEven())
            {
                table.AddRow(
                    customer.Identifier.ToString(),
                    customer.CompanyName,
                    customer.ContactTypeIdentifierNavigation.ContactType,
                    customer.ContactFirstName,
                    customer.ContactLastName,
                    customer.GenderIdentifierNavigation.GenderType);
            }
            else
            {
                table.AddRow(
                    customer.Identifier.ToString(),
                    $"[white]{customer.CompanyName}[/]",
                    customer.ContactTypeIdentifierNavigation.ContactType,
                    customer.ContactFirstName,
                    customer.ContactLastName,
                    customer.GenderIdentifierNavigation.GenderType);
            }


        }

        AnsiConsole.Clear();
        AnsiConsole.Write(table);
        AnsiConsole.MarkupLine("[LightGreen]Press a key to exit[/]");
        Console.ReadLine();
    }


}