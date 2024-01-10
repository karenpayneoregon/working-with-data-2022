#nullable enable
namespace IndexingSamplerApp.Models;

public class CustomContainer<T>
{
    internal CustomContainer(List<T> sender)
    {
        _array = sender.ToArray();
    }
    private T[] _array;
    public  List<T> Items => _array.ToList();

    // Length or Count is required for both [^1] and [2..^1]
    internal int Length => _array.Length;

    // Int indexer is required for [^1] but not for [2..^1]
    internal T this[int index] => _array[index];

    // Slice is required for [2..^1] but not for [^1]
    internal T[] Slice(int start, int length)
    {
        var slice = new T[length];
        Array.Copy(_array, start, slice, 0, length);
        return slice;
    }
}