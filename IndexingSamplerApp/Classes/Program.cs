using IndexingSamplerApp.Classes;
using IndexingSamplerApp.Models;
using System.Runtime.CompilerServices;
using System.Text;
using IndexingSamplerApp.Extensions;

// ReSharper disable once CheckNamespace
namespace IndexingSamplerApp;
internal partial class Program
{
    private static void MonthsSegments()
    {
        Console.WriteLine("First three months");
        Range firstThreeRange = 0..3;
        var firstThreeMonths = DateTimeHelpers.MonthNames[firstThreeRange];
        Console.WriteLine($"   {string.Join(",", firstThreeMonths)}");

        Console.WriteLine("Middle months");
        Range middleRange = 5..8;
        var middleMonths = DateTimeHelpers.MonthNames[middleRange];
        Console.WriteLine($"   {string.Join(",", middleMonths)}");

        Console.WriteLine("Between October and December inclusive");
        Range lastThreeRange = ^3..;
        var lastThreeMonths = DateTimeHelpers.MonthNames[lastThreeRange];
        Console.WriteLine($"   {string.Join(",", lastThreeMonths)}");

        Console.WriteLine("Between March and June exclusive");
        var between = DateTimeHelpers.MonthNames.ToList().BetweenInclusive("march", "june");
        Console.WriteLine($"   {string.Join(",", between)}");

        Console.WriteLine("Last month");
        Console.WriteLine($"   {DateTimeHelpers.MonthNames[^1]}");
        Console.WriteLine($"   {DateTimeHelpers.MonthNames.GetLast()}");

    }
    private static void DateOnlyExample1()
    {
        List<Container<DateOnly>> datesContainer =
            RangeHelpers.Get(DateTimeHelpers.NextWeeksDates());

        StringBuilder builder = new();

        foreach (var container in datesContainer)
        {
            builder.AppendLine($" {container.Value,-10:M/dd/yyyy} " +
                               $"{container.StartIndex,-6} " +
                               $"{container.EndIndex,-7}" +
                               $"{container.MonthIndex}");
        }

        Console.WriteLine(" DateOnly   Start  End    Ordinal");
        Console.WriteLine("            range  range  index");
        Console.WriteLine(builder);
    }

    private static void DateOnlyExample2()
    {
        var dates = DateTimeHelpers
            .GetMonthDays(DateTime.Now.Month)
            .BetweenDates(new DateOnly(2023, 5, 2), new DateOnly(2023, 5, 7));

        List<Container<DateOnly>> datesContainer = RangeHelpers.Get(dates);
        StringBuilder builder = new();

        foreach (var container in datesContainer)
        {
            builder.AppendLine($" {container.Value,-10:M/dd/yyyy} " +
                               $"{container.StartIndex,-6} " +
                               $"{container.EndIndex,-7}" +
                               $"{container.MonthIndex}");
        }

        Console.WriteLine(" DateOnly   Start  End    Ordinal");
        Console.WriteLine("            range  range  index");
        Console.WriteLine(builder);
    }

    public static void CustomContainerSpecial()
    {
        CustomContainer<DateOnly> nextWeekDates = new(DateTimeHelpers.NextWeeksDates());
        
        List<Container<DateOnly>> datesContainer = RangeHelpers.Get(nextWeekDates.Items);
        StringBuilder builder = new();

        foreach (var container in datesContainer)
        {
            builder.AppendLine($" {container.Value,-10:M/dd/yyyy} " +
                               $"{container.StartIndex,-6} " +
                               $"{container.EndIndex,-7}" +
                               $"{container.MonthIndex}");
        }

        Console.WriteLine(" Week day   Start  End    Ordinal");
        Console.WriteLine("            range  range  index");
        Console.WriteLine(builder);

        Console.WriteLine($"Start of week {nextWeekDates[0]} end of week {nextWeekDates[^1]}");

        Console.WriteLine();

        CustomContainer<Person> people = new(MockData.People);
        List<Container<Person>> peopleContainer = RangeHelpers.Get(people.Items);
        builder = new();

        foreach (var container in peopleContainer)
        {
            builder.AppendLine($" {container.Value,-20} " +
                               $"{container.StartIndex,-6} " +
                               $"{container.EndIndex,-7}" +
                               $"{container.MonthIndex}");
        }

        Console.WriteLine(" First/Last name      Start  End    Person");
        Console.WriteLine("                      range  range  index");
        Console.WriteLine(builder);

        Console.WriteLine();

    }

    /// <summary>
    /// In this example we find 2 in a list than get the remaining element
    /// by adding the to start index to create the end index using +3 yet a higher
    /// number would throw an exception so we assert that endIndex is in range
    ///
    /// Well the above can be simplified with
    ///    var array2 = list.ToArray()[startIndex..];
    /// Instead of
    ///    var array1 = list.ToArray()[startIndex..endIndex];
    /// 
    /// </summary>
    public static void CheckForOutOfBounds()
    {
        List<int> list = new List<int>() { 1, 2, 3, 4, 5 };


        var startIndex = list.Find(x => x == 2);
        var endIndex = startIndex + 3;


        if (endIndex <= list.Count)
        {
            var array1 = list.ToArray()[startIndex..endIndex];
            Console.WriteLine(string.Join(",", array1));
            var array2 = list.ToArray()[startIndex..];
        }
        else
        {
            Console.WriteLine("out of range");
        }

    }
    public static void StringIndexing()
    {
        string value = "I like C# for developing";
        Console.WriteLine(value);
        Console.WriteLine();
        // C# developing
        Console.WriteLine($"{value[7..10]}{value[14..]} for all.");
        Console.WriteLine(value[14..^0]);
    }
    /// <summary>
    /// Basics for indexing a list
    /// </summary>
    public static void ListIndexing()
    {
        StringBuilder builder = new();
        CustomContainer<Person> people = new(MockData.People);
        List<Container<Person>> peopleContainer = RangeHelpers.Get(people.Items);

        string firstName = "Daniel";

        foreach (var container in peopleContainer)
        {
            if (container.Value!.FirstName == firstName)
            {
                builder.AppendLine($" {container.Value,-20} " +
                                   $"{container.StartIndex,-6} " +
                                   $"{container.EndIndex,-7}" +
                                   $"{container.MonthIndex}\t***");
            }
            else
            {
                builder.AppendLine($" {container.Value,-20} " +
                                   $"{container.StartIndex,-6} " +
                                   $"{container.EndIndex,-7}" +
                                   $"{container.MonthIndex}");
            }

        }

        Console.WriteLine(" First/Last name      Start  End    Person");
        Console.WriteLine("                      range  range  index");
        Console.WriteLine(builder);

        Index indexer = new(MockData.People.FindIndex(p => p.FirstName == firstName));
        Console.WriteLine($"Fifth person: {people[indexer]}");

        Console.WriteLine();
        var lastFivePeople = people[^5..];

        Console.WriteLine("Last five people");
        Console.WriteLine(string.Join(",", lastFivePeople.Select(p => $"{p.FirstName} {p.LastName}")));

        Console.WriteLine();
        var reversed = Enumerable.Range(0, 10).ToArray();
        Console.WriteLine("First seven in reverse");
        foreach (var person in MockData.People.ToArray().Enumerate(^3..0))
        {
            Console.WriteLine(person.FirstName);
        }

        Console.WriteLine();
        Console.WriteLine("First three people");
        // 0 to 3 - get first three people
        Range range = Range.EndAt(indexer);
        var firstThreePeople = MockData.PeopleArray()[range];
        Console.WriteLine(string.Join(",", firstThreePeople.Select(p => $"{p.FirstName} {p.LastName}")));


        Console.WriteLine();
        Console.WriteLine("StartAt 3");
        // start at ordinal index 3 to end
        range = Range.StartAt(3);
        var fromThree = MockData.PeopleArray()[range];
        Console.WriteLine(string.Join(",", fromThree.Select(p => $"{p.FirstName} {p.LastName}")));

        // return all elements
        range = Range.All;
        var allPeople = MockData.PeopleArray()[range];

        Console.WriteLine();
        Console.WriteLine("Last person");
        var lastPerson = MockData.PeopleArray().GetLast();
        Console.WriteLine(lastPerson);


    }

    private static void ModelExample()
    {
        List<Container<Person>> peopleContainer = RangeHelpers.Get(MockData.People);
        StringBuilder builder = new();

        foreach (var container in peopleContainer)
        {
            builder.AppendLine($" {container.Value,-20} " +
                               $"{container.StartIndex,-6} " +
                               $"{container.EndIndex,-7}" +
                               $"{container.MonthIndex}");
        }

        Console.WriteLine(" First/Last name      Start  End    Person");
        Console.WriteLine("                      range  range  index");
        Console.WriteLine(builder);
    }

    private static void DaysExample()
    {
        List<Container<string>> dayContainer = RangeHelpers.Get(DateTimeHelpers.DayNames());
        StringBuilder builder = new();

        foreach (var container in dayContainer)
        {
            builder.AppendLine(
                $" {container.Value,-12} {container.StartIndex,-6} {container.EndIndex,-7}{container.MonthIndex}");
        }

        Console.WriteLine(" Day          Start  End    Day");
        Console.WriteLine("              range  range  index");
        Console.WriteLine(builder);
    }

    private static void MonthsExample()
    {
        List<Container<string>> monthContainer = RangeHelpers.Get(DateTimeHelpers.MonthNames.ToList());

        StringBuilder builder = new();
        foreach (var container in monthContainer)
        {
            builder.AppendLine($" {container.Value,-12} {container.StartIndex,-6} {container.EndIndex,-7}{container.MonthIndex}");
        }

        Console.WriteLine(" Month        Start  End    Month");
        Console.WriteLine("              range  range  index");
        Console.WriteLine(builder);
    }

    /// <summary>
    /// Get elements using Array.IndexOf for a specific name.
    /// </summary>
    public static void Demo()
    {

        Console.WriteLine("Get from start to specific string, include search string");
        string[] people = new[] { "Jane", "Jean", "Karen", "Marcus", "Bill", "Anne" };

        Index indexer = new(Array.IndexOf(people, "Marcus") + 1);

        var shortPeople = people[0..indexer];

        Console.WriteLine($"   {string.Join(",", shortPeople)}");


        Console.WriteLine("Get from start to specific string, exclude search string");
        indexer = new(Array.IndexOf(people, "Marcus"), false);
        shortPeople = people[..indexer];
        Console.WriteLine($"   {string.Join(",", shortPeople)}");
    }

    /// <summary>
    /// Given an array where each element is guaranteed to be correct length,
    /// format each element as a phone number  4033697792 to (403) 369-7792
    /// </summary>
    public static void PhoneNumbers()
    {

        List<int[]> phoneNumbers = new List<int[]>
        {
            4033697792.ToString().Select(c => int.Parse(c.ToString())).ToArray(),
            8867381939.ToString().Select(c => int.Parse(c.ToString())).ToArray(),
            5039991381.ToString().Select(c => int.Parse(c.ToString())).ToArray()
        };

        Console.WriteLine("Phone numbers formatted");

        foreach (int[] phoneNumber in phoneNumbers)
        {
            string GetNumbers(int start, int end) => string.Join("", phoneNumber[start..end]);

            Console.WriteLine($"   ({GetNumbers(0, 3)}) {GetNumbers(3, 6)}-{GetNumbers(6, 10)}");
        }

    }

}
