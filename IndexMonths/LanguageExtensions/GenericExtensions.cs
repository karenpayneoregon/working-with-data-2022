namespace IndexMonths.LanguageExtensions;

internal static class GenericExtensions
{
    public static T GetLast<T>(this List<T> source) => source[^1];
    public static T GetLast<T>(this T[] source) => source[^1];
}