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
  List<Map<T, T>> sortBy(String key, [bool isDesc = false]) {
    List<Map<T, T>> maps =
        where((T element) => (element as Map<T, T>).containsKey(key))
            .cast<Map<T, T>>()
            .toList();
    maps.sort((dynamic a, dynamic b) => a[key].compareTo(b[key]));
    return isDesc ? maps.reversed.toList() : maps;
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
  List<Map<T, T>> sortDescBy(String key) => sortBy(key, true);

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
  List<List<T>> chunk(int size) {
    if (size < 1) return <List<T>>[];

    return List<List<T>>.generate(
        length ~/ size + (length % size == 0 ? 0 : 1),
        (int index) => sublist(index * size,
            (index + 1) * size > length ? length : (index + 1) * size));
  }

  ///The split method breaks the list into equal sized lists of a given size
  ///
  ///Example:
  ///```dart
  ///list.split(2) // [1,2,3,4,5] -> [[1,2,3], [4,5]]
  ///```
  List<List<T>> split(int parts) {
    if (parts < 1) return <List<T>>[];

    int size = (length / parts).round();

    return List<List<T>>.generate(
        parts,
        (int i) => sublist(
            size * i, (i + 1) * size <= length ? (i + 1) * size : null));
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
    if (isEmpty || first.runtimeType != Map<T, T>) return <T>[];
    List<T?> list = <T>[];
    forEach((T element) => ((element as Map<T, T>).containsKey(key))
        ? list.add(element[key])
        : list);
    return list;
  }

  ///Get minimum number
  T get min => sorted().first;

  ///Get maximum number
  T get max => sortedDesc.first;

  ///Get sum of numbers
  num get sum => whereNumbers.reduce((num a, num b) => a + b);

  ///Get average of numbers
  num get avg => whereNumbers.sum / whereNumbers.length;

  ///Get numbers from a list
  List<num> get whereNumbers =>
      where((T element) => element is num).cast<num>().toList();

  ///Get median of numbers
  num get median {
    List<num> list = whereNumbers.sorted();
    int middleIndex = (list.length / 2).round();
    if (list.length % 2 == 0) {
      return (list[middleIndex - 1] + list[middleIndex]) / 2;
    } else {
      return list[middleIndex];
    }
  }

  ///Get mode of numbers
  num get mode {
    List<num> list = whereNumbers;

    num maxValue = 0.0;
    num maxCount = 0;

    for (int i = 0; i < list.length; ++i) {
      num count = 0;
      for (int j = 0; j < list.length; ++j) {
        if (list[j] == list[i]) {
          count++;
        }
      }

      if (count > maxCount) {
        maxCount = count;
        maxValue = list[i];
      }
    }
    return maxValue;
  }

  ///Gets only those values which is given
  ///
  ///Example:
  ///```dart
  ///list.whereOnly([key1, key2])
  ///```
  List<T> whereOnly(List<String> keys) {
    if (isEmpty || first.runtimeType != Map<T, T>) return <T>[];
    List<T> list = <T>[];
    forEach((T obj) {
      Map<T, T> map = <T, T>{};

      keys.forEach((dynamic key) {
        if ((obj as dynamic).containsKey(key))
          map.addAll(<T, T>{key: obj[key]});
      });

      if (map.isNotEmpty) list.add(map as T);
    });

    return list;
  }

  ///Removes elements from the list which is given
  ///
  ///Example:
  ///```dart
  ///list.whereNotOnly([key1, key2])
  ///```
  List<T> whereNotOnly(List<String> keys) {
    if (isEmpty || first.runtimeType != Map<T, T>) return <T>[];
    List<T> list = <T>[];
    forEach((T map) => keys.forEach((dynamic key) {
          if ((map as dynamic).containsKey(key)) (map as dynamic).remove(key);
        }));

    forEach((T map) {
      if ((map as dynamic).isNotEmpty) list.add(map);
    });

    return list;
  }

  ///Removes elements from the list that do not have a specified item value
  ///
  ///that is not contained within the given list
  ///
  ///Example:
  ///```dart
  ///list.whereIn("key", [value1, value2])
  ///```
  List<T> whereIn(String key, List<num> params) {
    if (isEmpty || first.runtimeType != Map<T, T>) return <T>[];
    List<T> list = <T>[];

    params.forEach((dynamic param) {
      forEach((T map) {
        if ((map as Map<T, T>).has(key, param)) list.add(map);
      });
    });

    return list;
  }

  ///Removes elements from the list that have a specified item value
  ///
  ///that is not contained within the given list
  ///
  ///Example:
  ///```dart
  ///list.whereNotIn("key", [value1, value2])
  ///```
  List<T> whereNotIn(String key, List<num> params) {
    if (isEmpty || first.runtimeType != Map<T, T>) return <T>[];
    params.forEach((dynamic param) =>
        removeWhere((dynamic map) => (map as Map<T, T>).has(key, param)));
    return this;
  }

  /// Filters the collection by determining if a specified item value is within a given range
  ///
  /// Example:
  ///```dart
  ///list.whereBetween("key",start, end)
  ///```
  List<T> whereBetween(String key, num start, num end) {
    if (isEmpty || first.runtimeType != Map<T, T>) return <T>[];
    List<T> list = <T>[];

    forEach((dynamic element) {
      if (element.containsKey(key) && element[key]) {
        if (element[key] >= start && element[key] <= end) list.add(element);
      }
    });

    return list;
  }

  ///Filters the collection by determining if a specified item value is outside of a given range
  ///
  ///Example:
  ///```dart
  ///list.whereNotBetween("key", start, end)
  ///```
  List<T> whereNotBetween(String key, num start, num end) {
    if (isEmpty || first.runtimeType != Map<T, T>) return <T>[];
    List<T> result = <T>[];
    forEach((dynamic element) {
      if (element.containsKey(key) && element[key]) {
        if (element[key] < start || element[key] > end) result.add(element);
      }
    });

    return result;
  }

  ///Checks given key/value is exists or not
  bool hasKeyValue(String key, T value) {
    if (isEmpty) return false;

    return any((T element) {
      if (element is! Map<T, T>) return false;
      return element.has(key, value);
    });
  }

  ///Checks given key is exists or not
  bool hasKey(String key) {
    if (isEmpty) return false;

    return any((T element) {
      if (element is! Map<T, T>) return false;
      return element.containsKey(key);
    });
  }

  ///Checks given value is exists or not
  bool hasValue(T value) {
    if (isEmpty) return false;

    return any((T element) {
      if (element is! Map<T, T>) return false;
      return element.containsKey(value);
    });
  }
}
