namespace IndexMonths.LanguageExtensions;

internal static class StringExtensions
{
    /// <summary>
    /// Trim last character from a string 
    /// </summary>
    /// <param name="sender">string to work on</param>
    /// <returns>Original string if null otherwise original string minus the last character</returns>
    public static string TrimLastCharacter(this string sender) =>
        string.IsNullOrWhiteSpace(sender) ?
            sender :
            sender[..^1];
}