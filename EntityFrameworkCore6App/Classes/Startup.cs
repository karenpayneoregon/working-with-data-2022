using System.Runtime.CompilerServices;

namespace EntityFrameworkCore6App.Classes;

internal class Startup
{
    [ModuleInitializer]
    public static void Init()
    {
        Console.Title = "Code sample - EF Core 6";
        WindowUtility.SetConsoleWindowPosition(WindowUtility.AnchorWindow.Center);
    }
}