///List extension to extend List functionality
extension ListExtension on List<dynamic> {
  ///check list is empty or null
  ///
  ///Example:
  ///```dart
  ///list.isEmptyOrNull // false
  ///```
  // ignore: unnecessary_null_comparison
  bool get isEmptyOrNull => this == null || isEmpty;

  ///check list is neither empty nor null
  /// ///check list is empty or null
  ///
  ///Example:
  ///```dart
  ///list.isNotEmptyOrNull // false
  ///```
  bool get isNotEmptyOrNull => !isEmptyOrNull;

  ///Get sorted list
  ///
  ///Example:
  ///```dart
  ///list.sorted(true) // create new list with descending order
  ///```
  List<dynamic> sorted([bool isDesc = false]) {
    sort();
    return isDesc ? reversed.toList() : this;
  }

  ///Get sorted list
  ///
  ///Example:
  ///```dart
  ///list.sortedDesc() // create new list with descending order
  ///```
  List<dynamic> get sortedDesc => sorted(true);

  ///The sortBy method sorts the list of objects by the given key.
  ///
  ///Example:
  ///```dart
  ///list.sortBy("price") // create new list with soreted list according to price
  ///```
  List<dynamic> sortBy(String key, [bool isDesc = false]) {
    if (first is! Map<dynamic, dynamic> || !first.containsKey(key))
      return <dynamic>[];

    sort((dynamic a, dynamic b) => a[key].compareTo(b[key]));

    return isDesc ? reversed.toList() : this;
  }

  ///The sortBy method sorts the list of objects by the given key.
  ///
  ///Example:
  ///```dart
  ///list.sortBy("price")
  ///
  ///This method has the same signature as the sortBy method,
  ///but will sort the collection in the opposite order
  ///```
  List<dynamic> sortByDesc(String key) => sortBy(key, true);

  ///Returns random value from this list
  ///
  ///Example:
  ///```dart
  ///list.random // [1,2,3,4,5] -> 4
  ///```
  dynamic get random => (this..shuffle()).first;

  ///The chunk method breaks the list into multiple, smaller list of a given size
  ///
  ///Example:
  ///```dart
  ///list.chunk(2) // [1,2,3,4,5] -> [[1,2], [3,4], [5]]
  ///```
  List<dynamic> chunk(int size) {
    List<dynamic> _chunks = <dynamic>[];

    if (size < 1) return <dynamic>[];

    for (int i = 0; i < length; i += size)
      _chunks.add(sublist(i, i + size > length ? length : i + size));

    return _chunks;
  }

  ///The split method breaks the list into equal sized lists of a given size
  ///
  ///Example:
  ///```dart
  ///list.split(2) // [1,2,3,4,5] -> [[1,2,3], [4,5]]
  ///```
  List<dynamic> split(int parts) {
    if (parts < 1) return <dynamic>[];

    int _size = (length / parts).round();

    return List<dynamic>.generate(
        parts,
        (int i) => sublist(
            _size * i, (i + 1) * _size <= length ? (i + 1) * _size : null));
  }

  ///Get minimum number
  dynamic get min => sorted().first;

  ///Get maximum number
  dynamic get max => sortedDesc.first;

  ///Get sum of numbers
  num get sum => cast<num>().reduce((num a, num b) => a + b);

  ///Get average of numbers
  num get avg => sum / cast<num>().length;

  ///Get median of numbers
  num get median {
    num middle = length ~/ 2;
    if (length.isOdd)
      return this[middle as int];
    else
      return (this[middle - 1 as int] + this[middle as int]) / 2.0;
  }

  ///Get mode of numbers
  num get mode {
    num maxValue = 0.0;
    num maxCount = 0;

    for (num i = 0; i < length; ++i) {
      num count = 0;
      for (num j = 0; j < length; ++j)
        if (this[j as int] == this[i as int]) ++count;

      if (count > maxCount) {
        maxCount = count;
        maxValue = this[i as int];
      }
    }
    return maxValue;
  }
}
