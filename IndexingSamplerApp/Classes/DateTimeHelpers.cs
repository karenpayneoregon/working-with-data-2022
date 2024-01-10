
namespace IndexingSamplerApp.Classes;

public static class DateTimeHelpers
{
    public static string[] MonthNames => CurrentInfo!.MonthNames[..^1];
    public static List<string> MonthNameList => CurrentInfo!.MonthNames[..^1].ToList();
    public static List<string> DayNames() => CurrentInfo!.DayNames.ToList();
    public static DateOnly Next(this DateOnly from, DayOfWeek dayOfWeek)
    {
        int start = (int)from.DayOfWeek;
        int target = (int)dayOfWeek;

        if (target <= start)
        {
            target += 7;
        }

        return from.AddDays(target - start);
    }

    public static List<DateOnly> NextWeeksDates()
        => Enumerable.Range(0, 7).Select(index =>
                DateOnly.FromDateTime(DateTime.Now).Next(DayOfWeek.Sunday).AddDays(index))
            .ToList();

    public static List<DateOnly> BetweenDates(this List<DateOnly> sender, DateOnly startValue, DateOnly endValue)
    {

        var startIndex = sender.FindIndex(element => element.Equals(startValue));
        var endIndex = sender.FindIndex(element => element.Equals(endValue)) - startIndex + 1;

        return startIndex == -1 || endIndex == -1 ?
            null :
            sender.GetRange(startIndex, endIndex);
    }

    public static List<DateOnly> GetMonthDays(int month)
    {
        var year = DateTime.Now.Year;

        return Enumerable.Range(1, DateTime.DaysInMonth(year, month))
            .Select(day => new DateOnly(year, month, day))
            .ToList();
    }

    public static DateTime StartOfWeek(this DateTime dt, DayOfWeek startOfWeek)
    {
        int diff = (7 + (dt.DayOfWeek - startOfWeek)) % 7;
        return dt.AddDays(-1 * diff).Date;
    }
}