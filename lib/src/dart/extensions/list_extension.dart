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
    final List<T> copy = List<T>.from(this);
    copy.sort();
    return isDesc ? copy.reversed.toList() : copy;
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
    if (!hasKey(key)) {
      return <Map<T, T>>[];
    }
    final List<Map<T, T>> maps = whereType<Map<T, T>>()
        .where((Map<T, T> element) => element.containsKey(key))
        .toList();
    try {
      maps.sort((Map<T, T> a, Map<T, T> b) {
        final T? aValue = a[key];
        final T? bValue = b[key];
        if (aValue is int && bValue is int) {
          return aValue.compareTo(bValue);
        }
        throw ArgumentError('Values for key "$key" must be of type int');
      });
    } on ArgumentError {
      // If an error is thrown, return an empty list
      return <Map<T, T>>[];
    }
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
  Map<T, List<T>> groupBy(T Function(T) fn) {
    return Map<T, List<T>>.fromIterable(map(fn).toSet(),
        value: (dynamic i) => where((T v) => fn(v) == i).toList());
  }

  ///Group the objects according to key
  ///
  ///Example:
  ///```dart
  ///list.groupByKey("key")
  ///```
  Map<T, List<T>> groupByKey(String key) => groupBy((dynamic e) => e[key] as T);

  ///The latest methods allow you to easily order results by id in descending order.
  ///By default, the result will be ordered by the id field.
  ///Or, you may pass the key that you wish to sort by:
  ///
  ///Example:
  ///```dart
  ///list.latest()
  ///```
  List<Map<T, T>> latest([String key = 'id']) => sortBy(key, true);

  ///The latestFirst methods allow you to easily order results by
  ///id in descending order and get first record.
  ///By default, the result will be ordered by the id field.
  ///Or, you may pass the key that you wish to sort by:
  ///
  ///Example:
  ///```dart
  ///list.latestFirst()
  ///```
  Map<T, T> latestFirst([String key = 'id']) {
    final List<Map<T, T>> sortedMaps = latest(key);
    if (sortedMaps.isEmpty) {
      return <T, T>{};
    }
    final Map<T, T> firstMap = sortedMaps.first;
    if (firstMap.isEmpty) {
      return <T, T>{};
    }
    return firstMap;
  }

  ///The oldest methods allow you to easily order results by id.
  ///By default, the result will be ordered by the id field.
  ///Or, you may pass the column name that you wish to sort by:
  ///
  ///Example:
  ///```dart
  ///list.oldest()
  ///```
  List<Map<T, T>> oldest([String key = 'id']) => sortBy(key);

  ///The oldestFirst methods allow you to easily order results by id and get first record.
  ///By default, the result will be ordered by the id field.
  ///Or, you may pass the column name that you wish to sort by:
  ///
  ///Example:
  ///```dart
  ///list.oldestFirst()
  ///```
  Map<T, T> oldestFirst([String key = 'id']) {
    final List<Map<T, T>> sortedMaps = oldest(key);
    if (sortedMaps.isEmpty) {
      return <T, T>{};
    }
    final Map<T, T> firstMap = sortedMaps.first;
    if (firstMap.isEmpty) {
      return <T, T>{};
    }
    return firstMap;
  }

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
    if (size < 1) {
      return <List<T>>[];
    }

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
    if (parts < 1) {
      return <List<T>>[];
    }

    final int size = (length / parts).round();

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
    if (isEmpty) {
      return <T>[];
    }
    final List<T> result = <T>[];
    for (final T element in this) {
      if (element is Map<String, T> && element.containsKey(key)) {
        result.add(element[key] as T);
      }
    }
    return result;
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
    final List<num> list = whereNumbers.sorted();
    final int middleIndex = (list.length / 2).round();
    if ((list.length).isEven) {
      return (list[middleIndex - 1] + list[middleIndex]) / 2;
    } else {
      return list[middleIndex];
    }
  }

  ///Get mode of numbers
  num get mode {
    final List<num> list = whereNumbers;

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
    if (isEmpty) {
      return <T>[];
    }
    final List<T> result = <T>[];
    for (final T element in this) {
      if (element is Map<String, dynamic>) {
        final Map<String, dynamic> map = <String, dynamic>{};
        for (final String key in keys) {
          if (element.containsKey(key)) {
            map[key] = element[key];
          }
        }
        if (map.isNotEmpty) {
          result.add(map as T);
        }
      }
    }
    return result;
  }

  ///Removes elements from the list which is given
  ///
  ///Example:
  ///```dart
  ///list.whereNotOnly([key1, key2])
  ///```
  List<T> whereNotOnly(List<String> keys) {
    if (isEmpty) {
      return <T>[];
    }
    final List<T> result = <T>[];

    for (final T element in this) {
      if (element is Map<String, dynamic>) {
        for (final String key in keys) {
          if (element.containsKey(key)) {
            element.remove(key);
          }
        }
        if (element.isNotEmpty) {
          result.add(element);
        }
      }
    }

    return this;
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
    if (isEmpty) {
      return <T>[];
    }
    final List<T> result = <T>[];

    for (final num param in params) {
      for (final T element in this) {
        if (element is Map<T, T> &&
            element.containsKey(key) &&
            element[key] == param) {
          result.add(element);
        }
      }
    }

    return result;
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
    if (isEmpty) {
      return <T>[];
    }
    final List<T> result = toList();
    for (final num param in params) {
      result.removeWhere((T map) =>
          map is Map<String, T> && map.containsKey(key) && map[key] == param);
    }
    return result;
  }

  /// Filters the collection by determining if a specified item value is within a given range
  ///
  /// Example:
  ///```dart
  ///list.whereBetween("key",start, end)
  ///```
  List<T> whereBetween(String key, num start, num end) {
    if (isEmpty) {
      return <T>[];
    }
    final List<T> result = <T>[];
    for (final T element in this) {
      if (element is Map<String, dynamic> &&
          element.containsKey(key) &&
          element[key] is num) {
        if ((element[key] as int >= start) && (element[key] as int <= end)) {
          result.add(element);
        }
      }
    }

    return this;
  }

  ///Filters the collection by determining if a specified item value is outside of a given range
  ///
  ///Example:
  ///```dart
  ///list.whereNotBetween("key", start, end)
  ///```
  List<T> whereNotBetween(String key, num start, num end) {
    if (isEmpty) {
      return <T>[];
    }
    final List<T> result = <T>[];
    for (final T element in this) {
      if (element is Map<dynamic, dynamic> &&
          element.containsKey(key) &&
          element[key] is num) {
        final num value = element[key] as num;
        if (value < start || value > end) {
          result.add(element);
        }
      }
    }

    return result;
  }

  ///Checks given key/value is exists or not
  ///
  /// [key] is the key of the map.
  /// [value] is the value of the map.
  ///
  /// Returns true if the key/value pair exists in the map.
  ///
  /// Example:
  ///```dart
  /// var map = {'name': 'John', 'age': 25};
  /// map.hasKeyValue('name', 'John'); // true
  /// map.hasKeyValue('age', 25); // true
  /// map.hasKeyValue('gender', 'male'); // false
  ///```
  bool hasKeyValue(String key, T value) {
    if (isEmpty) {
      return false;
    }

    return any((T element) {
      if (element is! Map<T, T>) {
        return false;
      }
      return element.has(key, value);
    });
  }

  ///Checks if the given [kry] exists in the map.
  ///
  ///Returns true if any of the keys in the map are equal to [key].
  ///
  /// Example:
  ///```dart
  ///map.hasKey("key") // true
  ///```
  bool hasKey(String key) {
    if (isEmpty) {
      return false;
    }

    return any((T element) {
      if (element is! Map<T, T>) {
        return false;
      }
      return element.containsKey(key);
    });
  }

  ///Checks if the given [value] exists in the map.
  ///
  ///Returns true if any of the values in the map are equal to [value].
  ///
  /// Example:
  ///```dart
  ///map.hasValue("value") // true
  ///```
  bool hasValue(T value) {
    if (isEmpty) {
      return false;
    }

    return any((T element) {
      if (element is! Map<T, T>) {
        return false;
      }
      return element.containsValue(value);
    });
  }
}
