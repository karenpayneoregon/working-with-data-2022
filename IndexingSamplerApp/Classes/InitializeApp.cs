using System.Runtime.CompilerServices;

namespace IndexingSamplerApp.Classes;
internal class InitializeApp
{

    [ModuleInitializer]
    public static void Init()
    {
        Console.Title = "Code sample";
        WindowUtility.SetConsoleWindowPosition(WindowUtility.AnchorWindow.Fill);
    }
}
