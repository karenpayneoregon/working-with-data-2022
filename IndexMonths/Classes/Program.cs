using System.Runtime.CompilerServices;


// ReSharper disable once CheckNamespace
namespace IndexMonths
{
    internal partial class Program
    {
        [ModuleInitializer]
        public static void Init()
        {
            AnsiConsole.MarkupLine("");
            Console.Title = "Code sample: Month indexing";
            WindowUtility.SetConsoleWindowPosition(WindowUtility.AnchorWindow.Center);
        }
        private static Table CreateTable()
        {
            return new Table()
                .RoundedBorder().BorderColor(Color.LightSlateGrey)
                .AddColumn("[b]Name[/]")
                .AddColumn("[b]Index[/]")
                .AddColumn("[b]Start Index[/]")
                .AddColumn("[b]End Index[/]")
                .Alignment(Justify.Center)
                .Title("[white on chartreuse3]Month indexing[/]");
        }
        private static void Render(Rule rule)
        {
            AnsiConsole.Write(rule);
            AnsiConsole.WriteLine();
        }

        private static void ExitPrompt()
        {

            Render(new Rule($"[green1]Press a key to exit[/]")
                .RuleStyle(Style.Parse("white"))
                .Centered());

            Console.ReadLine();
        }
    }
}
