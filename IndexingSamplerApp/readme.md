# C# 8 indices and ranges basics


## Definitions

[Index Operator](https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/operators/member-access-operators#index-from-end-operator-) <kbd>^</kbd>

Index operator **^** means from the end. Consequently, `array[^1]` means first element from the end. It is analogous to the common indexing, `array[1]` means one element from the start. The index **^0** means the end.

[Range Operator](https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/operators/member-access-operators#range-operator-) <kbd>..</kbd>

As you have shown in your example above, it is much convenient to create substring using range operator. Range operator can be used to create subarrays as well.

Example

```csharp
var array = new {1, 2, 3, 4, 5, 6, 7};
var range = array[2..5]
```

The following table shows various ways to express collection ranges:

(From Microsoft)

| Range operator expression        |   Description
|:------------- |:-------------
| .. | All values in the collection. 
| ..end | Values from the start to the **end** exclusively
| start.. | Values from the **start** inclusively to the end.
| start..end | Values from the **start** inclusively to the **end** exclusively. 
| ^start.. | Values from the **start** inclusively to the end counting from the end.
| ..^end | Values from the start to the **end** exclusively counting from the end. 
| start..^end | Values from **start** inclusively to **end** exclusively counting from the end. 
| ^start..^end | Values from **start** inclusively to **end** exclusively both counting from the end. 