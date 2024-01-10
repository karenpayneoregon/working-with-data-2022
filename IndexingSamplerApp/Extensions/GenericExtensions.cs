using System.Numerics;

namespace IndexingSamplerApp.Extensions;

public static class GenericExtensions
{

    #region Same as Last extension without internal assertions
    public static T GetLast<T>(this List<T> source) => source[^1];
    public static T GetLast<T>(this T[] source) => source[^1]; 
    #endregion



    /// <summary>
    /// Produces an array where the first element is startValue, last element is endValue with all values between both case insensitive.
    /// </summary>
    /// <param name="sender">List of <see cref="string"/></param>
    /// <param name="startValue">first element to start the range</param>
    /// <param name="endValue">last element to end the range</param>
    /// <returns>range between startValue and endValue or null if neither start or end values do not exist in sender array</returns>
    public static List<string> Between(this List<string> sender, string startValue, string endValue)
    {

        var startIndex = sender.FindIndex(element =>
            element.Equals(
                startValue,
                StringComparison.OrdinalIgnoreCase));

        var endIndex = sender.FindIndex(element =>
            element.Equals(
                endValue,
                StringComparison.OrdinalIgnoreCase)) - startIndex + 1;

        return startIndex == -1 || endIndex == -1 ? null : sender.GetRange(startIndex, endIndex);

    }

    public static List<string> BetweenInclusive(this List<string> sender, string startValue, string endValue)
    {

        var startIndex = sender.FindIndex(element =>
            element.Equals(
                startValue,
                StringComparison.OrdinalIgnoreCase));

        var endIndex = sender.FindIndex(element =>
            element.Equals(
                endValue,
                StringComparison.OrdinalIgnoreCase)) - startIndex + 1;

        return startIndex == -1 || 
               endIndex == -1 ? null : sender.GetRange(startIndex +1, endIndex -2);

    }

    public static int Normalize(this Index index, int length) 
        => index.IsFromEnd ? length - index.Value : index.Value;

    public static (int start, int end) Normalize(this Range range, int length) 
        => (range.Start.Normalize(length), range.End.Normalize(length));

    public static IEnumerable<T> Enumerate<T>(this T[] items, Range range)
    {
        var (start, end) = range.Normalize(items.Length);

        return start <= end ? items[range] : GetRangeReverse();

        IEnumerable<T> GetRangeReverse()
        {
            for (int i = start; i >= end; i--)
                yield return items[i];
        }
    }

}