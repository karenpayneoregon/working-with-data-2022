using Spectre.Console;

namespace EntityFrameworkCore6App.Classes
{
    internal class SpectreConsoleHelpers
    {
        public static Table CreateTable() =>
            new Table()
                .RoundedBorder()
                .ShowFooters()
                .AddColumn("[b]Id[/]")
                .AddColumn("[b]Company[/]")
                .AddColumn("[b]Contact type[/]")
                .AddColumn("[b]Contact first name[/]")
                .AddColumn("[b]Contact last name[/]")
                .AddColumn("[b]Contact gender[/]")
                .Alignment(Justify.Center)
                .BorderColor(Color.Chartreuse1)
                .Title("[LightGreen]Customers with SortPropertyName[/]");
    }
}
