using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ConsoleDump;
using CustomerDatabaseLibraryEntityFramework.Classes;
using static System.Globalization.DateTimeFormatInfo;

namespace IndexRangeApp
{
    partial class Program
    {
        static void Main(string[] args)
        {

            //DataOperations.CustomersWithIncludes().Dump("Customers");
            List<Container<string>> monthContainers = RangeHelpers.RangeDetails(RangeHelpers.MonthNames());
            StringBuilder builder = new();
            foreach (var container in monthContainers)
            {
                builder.AppendLine($" {container.Value,-12} {container.StartIndex,-6} {container.EndIndex,-7}{container.MonthIndex}");
            }

            Console.WriteLine(" Month        Start  End    Month Index");
            Console.WriteLine("              range  range  index");
            Console.WriteLine(builder);


            Console.WriteLine();

            var dayContainers = RangeHelpers.RangeDetails(RangeHelpers.DayNames());
            builder = new();
            foreach (var container in dayContainers)
            {
                builder.AppendLine($" {container.Value,-12} {container.StartIndex,-6} {container.EndIndex,-7}{container.MonthIndex}");
            }
            Console.WriteLine(" Day          Start  End    Day Index");
            Console.WriteLine("              range  range  index");
            Console.WriteLine(builder);

            Console.ReadLine();
        }

        private static void Dump()
        {
            static string[] GetFirstFourPersons(string[] people)
            {
                var result = new string[4];
                for (int index = 0; index < 4; index++)
                {
                    result[index] = people[index];
                }

                return result;
            }

            List<int> integerList = new() { 1, 2, 3, 4, 5 };
            //var integerContainers = Helpers.RangeDetails(integerList);

            //Console.WriteLine("Start End  Value");
            //foreach (var container in integerContainers)
            //{
            //    Console.WriteLine($"{container.StartIndex,-3}{container.EndIndex,5}{container.Value,5}");
            //}

            Console.WriteLine();
            var stringContainers = RangeHelpers.RangeDetails(RangeHelpers.MonthNames());
            StringBuilder builder = new();
            foreach (var container in stringContainers)
            {
                builder.AppendLine($" {container.Value,-12} {container.StartIndex,-6} {container.EndIndex, -7}{container.MonthIndex}");
            }

            Console.WriteLine(" Month        Start  End    Month Index");
            Console.WriteLine("              range  range  index");
            Console.WriteLine(builder);
            return;

            Console.WriteLine();
            List<int> list = new() { 1, 2, 3, 4, 5 };
            List<int> expected = new() { 1, 2, 3 };

            var firstThree = list.ToArray()[..3];
            Console.WriteLine($"FirstThree equals expected {firstThree.SequenceEqual(expected).ToYesNo()}");

            Console.WriteLine();
            Console.WriteLine("First 4");
            string[] People = new[] { "Jane", "Jean", "Grey", "Marcus", "Theophilus", "Keje" };
            var firstFour = GetFirstFourPersons(People);

            // conventional iterating for-each
            foreach (var person in firstFour)
            {
                Console.WriteLine(person);
            }

            Console.WriteLine();

            firstFour = People[..4];

            foreach (var person in firstFour)
            {
                Console.WriteLine(person);
            }

            Console.WriteLine();
            Index indexer = new(Array.IndexOf(People, "Marcus") + 1);

            firstFour = People[0..indexer];

            foreach (var person in firstFour)
            {
                Console.WriteLine(person);
            }

            Console.WriteLine();
            Console.WriteLine("Ranges: Last two");

            Range lastTwoElement = ^2..;

            var lastTwo = People[lastTwoElement];
            Console.WriteLine(string.Join(",", lastTwo));
        }
    }

    public class Container<T>
    {
        public T? Value { get; set; }
        public Index StartIndex { get; set; }
        public int MonthIndex { get; set; }
        public Index EndIndex { get; set; }
    }

    class RangeHelpers
    {
        public static List<string> MonthNames() => CurrentInfo!.MonthNames[..^1].ToList();
        public static List<string> DayNames() => CurrentInfo!.DayNames.ToList();

        public static List<Container<T>> RangeDetails<T>(List<T> list)
        {
            var elementsList = list.Select((element, index) => new Container<T>
            {
                Value = element,
                StartIndex = new Index(index),
                EndIndex = new Index(Enumerable.Range(0, list.Count).Reverse().ToList()[index], 
                    true),
                MonthIndex = index +1
            }).ToList();

            return elementsList;
        }
    }

    public static class StringExtensions
    {
        public static string ToYesNo(this bool value)
            => value ? "Yes" : "No";
    }
}
