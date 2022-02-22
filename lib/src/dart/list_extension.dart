import 'map_extension.dart';

///List extension to extend List functionality
extension ListExtension<T> on List<T> {
  ///Get sorted list
  ///
  ///Example:
  ///```dart
  ///list.sorted(true) // create new list with ascending order
  ///```
  List<T> sorted([bool isDesc = false]) {
    sort();
    return isDesc ? reversed.toList() : this;
  }

  ///Get sorted list
  ///
  ///Example:
  ///```dart
  ///list.sortedDesc() // create new list with descending order
  ///```
  List<T> get sortedDesc => sorted(true);

  ///The sortBy method sorts the list of maps by the given key.
  ///
  ///Example:
  ///```dart
  ///list.sortBy("price") // create new list with ascending order by according to price
  ///```
  List<T> sortBy(String key, [bool isDesc = false]) {
    if (isEmpty || first is! Map<T, T>) return <T>[];

    if (!(first as Map<T, T>).containsKey(key)) return <T>[];

    sort((dynamic a, dynamic b) => a[key].compareTo(b[key]));

    return isDesc ? reversed.toList() : this;
  }

  ///The sortDescBy method sorts the list of objects by the given key.
  ///
  ///Example:
  ///```dart
  ///list.sortDescBy("price")
  ///
  ///This method has the same signature as the sortBy method,
  ///but will sort the collection in the opposite order
  ///```
  List<T> sortDescBy(String key) => sortBy(key, true);

  ///Group by objects according to condition
  ///
  ///Example:
  ///```dart
  ///list.groupBy(fn)
  ///```
  Map<T, List<T>> groupBy(T Function(dynamic) fn) {
    return Map<T, List<T>>.fromIterable(map(fn).toSet(),
        value: (dynamic i) => where((dynamic v) => fn(v) == i).toList());
  }

  ///Group the objects according to key
  ///
  ///Example:
  ///```dart
  ///list.groupByKey("key")
  ///```
  Map<T, List<T>> groupByKey(String key) => groupBy((dynamic e) => e[key]);

  ///The latest methods allow you to easily order results by id in descending order.
  ///By default, the result will be ordered by the id field.
  ///Or, you may pass the key that you wish to sort by:
  ///
  ///Example:
  ///```dart
  ///list.latest()
  ///```
  List<T> latest([String key = 'id']) {
    if (!hasKey(key)) return <T>[];
    sort((dynamic a, dynamic b) => b[key].compareTo(a[key]));
    return this;
  }

  ///The latestFirst methods allow you to easily order results by
  ///id in descending order and get first record.
  ///By default, the result will be ordered by the id field.
  ///Or, you may pass the key that you wish to sort by:
  ///
  ///Example:
  ///```dart
  ///list.latestFirst()
  ///```
  Map<T, T> latestFirst([String key = 'id']) => latest(key).first as Map<T, T>;

  ///The oldest methods allow you to easily order results by id.
  ///By default, the result will be ordered by the id field.
  ///Or, you may pass the column name that you wish to sort by:
  ///
  ///Example:
  ///```dart
  ///list.oldest()
  ///```
  List<T> oldest([String key = 'id']) {
    if (!hasKey(key)) return <T>[];
    sort((dynamic a, dynamic b) => a[key].compareTo(b[key]));
    return this;
  }

  ///The oldestFirst methods allow you to easily order results by id and get first record.
  ///By default, the result will be ordered by the id field.
  ///Or, you may pass the column name that you wish to sort by:
  ///
  ///Example:
  ///```dart
  ///list.oldestFirst()
  ///```
  Map<T, T> oldestFirst([String key = 'id']) => oldest(key).first as Map<T, T>;

  ///Returns random value from this list
  ///
  ///Example:
  ///```dart
  ///list.random // [1,2,3,4,5] -> 4
  ///```
  T get random => (this..shuffle()).first;

  ///The chunk method breaks the list into multiple, smaller list of a given size
  ///
  ///Example:
  ///```dart
  ///list.chunk(2) // [1,2,3,4,5] -> [[1,2], [3,4], [5]]
  ///```
  List<T> chunk(int size) {
    List<dynamic> _chunks = <dynamic>[];

    if (size < 1) return <T>[];

    for (int i = 0; i < length; i += size)
      _chunks.add(sublist(i, i + size > length ? length : i + size));

    return _chunks as List<T>;
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

  ///Merge list of lists into single list
  ///
  ///Example:
  ///```dart
  ///list.flatten // [[1,2],[3,4]] -> [1,2,3,4]
  ///```
  List<T> get flatten => expand((T i) => i as List<T>).toList();

  ///The [pluck] method retrieves all of the values for a given key
  ///
  ///Example:
  ///```dart
  ///
  ///list.pluck("id")
  ///
  /// [
  ///     {"id":1,"name":"Tony"},
  ///     {"id":2,"name":"Thor"}
  /// ]
  ///
  /// [1,2]
  ///```
  List<T?> pluck(String key) {
    List<T?> _list = <T>[];
    forEach((T element) => ((element as Map<T, T>).containsKey(key))
        ? _list.add(element[key])
        : _list);
    return _list;
  }

  ///Get minimum number
  T get min => sorted().first;

  ///Get maximum number
  T get max => sortedDesc.first;

  ///Get sum of numbers
  num get sum => cast<num>().reduce((num a, num b) => a + b);

  ///Get average of numbers
  num get avg => sum / cast<num>().length;

  ///Get median of numbers
  num get median {
    num middle = length ~/ 2;
    if (length.isOdd)
      return this[middle as int] as num;
    else
      return ((this[middle - 1 as int] as num) + (this[middle as int] as num)) /
          2.0;
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
        maxValue = this[i as int] as num;
      }
    }
    return maxValue;
  }

  ///Checks given key/value is exists or not
  bool hasKeyValue(String key, T value) => any(
      (T element) => (element is Map<T, T>) ? element.has(key, value) : false);

  ///Checks given key is exists or not
  bool hasKey(String key) =>
      any((T element) => (element as Map<T, T>).containsKey(key));

  ///Checks given value is exists or not
  bool hasValue(T value) =>
      any((T element) => (element as Map<T, T>).containsValue(value));
}
