/// Extension on List<T> to provide additional functionality.
extension ListExtension<T> on List<T> {
  /// Returns a new sorted list.
  ///
  /// If [isDesc] is true, the list will be sorted in descending order.
  /// Otherwise, it will be sorted in ascending order.
  ///
  /// Example:
  /// ```dart
  /// final sortedList = list.sorted(isDesc: true);
  /// ```
  List<T> sorted({bool isDesc = false}) {
    final List<T> copy = List<T>.of(this);
    copy.sort();
    return isDesc ? copy.reversed.toList() : copy;
  }

  /// Returns a new list sorted in descending order.
  ///
  /// Example:
  /// ```dart
  /// final descendingList = list.sortedDesc;
  /// ```
  List<T> get sortedDesc => sorted(isDesc: true);

  /// Sorts a list of maps by the given key.
  ///
  /// [key] is the key to sort by.
  /// If [isDesc] is true, the list will be sorted in descending order.
  ///
  /// Example:
  /// ```dart
  /// final sortedMaps = list.sortBy("price");
  /// ```
  List<Map<T, T>> sortBy(String key, {bool isDesc = false}) {
    final List<Map<T, T>> maps = whereType<Map<T, T>>()
        .where((Map<T, T> element) => element.containsKey(key))
        .toList();
    try {
      maps.sort((Map<T, T> a, Map<T, T> b) {
        final T? aValue = a[key];
        final T? bValue = b[key];
        if (aValue is Comparable && bValue is Comparable) {
          return aValue.compareTo(bValue);
        }
        throw ArgumentError('Values for key "$key" must be comparable');
      });
    } on ArgumentError {
      return <Map<T, T>>[];
    }
    return isDesc ? maps.reversed.toList() : maps;
  }

  /// Sorts a list of maps by the given key in descending order.
  ///
  /// Example:
  /// ```dart
  /// final descendingSortedMaps = list.sortDescBy("price");
  /// ```
  List<Map<T, T>> sortDescBy(String key) => sortBy(key, isDesc: true);

  /// Groups the list elements according to a given condition.
  ///
  /// [fn] is a function that determines the grouping key for each element.
  ///
  /// Example:
  /// ```dart
  /// final groupedList = list.groupBy((item) => item.category);
  /// ```
  Map<T, List<T>> groupBy(T Function(T) fn) => Map<T, List<T>>.fromIterable(
        map(fn).toSet(),
        value: (i) => where((T v) => fn(v) == i).toList(),
      );

  /// Groups the list elements according to a specified key in each element.
  ///
  /// [key] is the key to group by.
  ///
  /// Example:
  /// ```dart
  /// final groupedByKey = list.groupByKey("category");
  /// ```
  Map<T, List<T>> groupByKey(String key) => groupBy((T e) {
        if (e is Map && e.containsKey(key)) {
          return e[key] as T;
        }
        throw ArgumentError('Key not found: $key');
      });

  /// Returns a list of maps sorted by the given key in descending order.
  ///
  /// By default, it sorts by the 'id' key.
  ///
  /// Example:
  /// ```dart
  /// final latestItems = list.latest("timestamp");
  /// ```
  List<Map<T, T>> latest([String key = 'id']) => sortBy(key, isDesc: true);

  /// Returns the first item from a list of maps sorted by the given key in descending order.
  ///
  /// By default, it sorts by the 'id' key.
  ///
  /// Example:
  /// ```dart
  /// final mostRecentItem = list.latestFirst("timestamp");
  /// ```
  Map<T, T> latestFirst([String key = 'id']) {
    final List<Map<T, T>> sortedMaps = latest(key);
    return sortedMaps.isNotEmpty ? sortedMaps.first : <T, T>{};
  }

  /// Returns a list of maps sorted by the given key in ascending order.
  ///
  /// By default, it sorts by the 'id' key.
  ///
  /// Example:
  /// ```dart
  /// final oldestItems = list.oldest("timestamp");
  /// ```
  List<Map<T, T>> oldest([String key = 'id']) => sortBy(key);

  /// Returns the first item from a list of maps sorted by the given key in ascending order.
  ///
  /// By default, it sorts by the 'id' key.
  ///
  /// Example:
  /// ```dart
  /// final oldestItem = list.oldestFirst("timestamp");
  /// ```
  Map<T, T> oldestFirst([String key = 'id']) {
    final List<Map<T, T>> sortedMaps = oldest(key);
    return sortedMaps.isNotEmpty ? sortedMaps.first : <T, T>{};
  }

  /// Returns a random element from the list.
  ///
  /// Example:
  /// ```dart
  /// final randomItem = list.random;
  /// ```
  T get random => (this..shuffle()).first;

  /// Breaks the list into multiple smaller lists of a given size.
  ///
  /// [size] is the size of each chunk.
  ///
  /// Example:
  /// ```dart
  /// final chunks = list.chunk(3);
  /// ```
  List<List<T>> chunk(int size) {
    if (size < 1 || isEmpty) {
      return <List<T>>[];
    }

    return List<List<T>>.generate(
      (length / size).ceil(),
      (int index) => sublist(
        index * size,
        (index + 1) * size > length ? length : (index + 1) * size,
      ),
    );
  }

  /// Splits the list into a specified number of approximately equal parts.
  ///
  /// [parts] is the number of parts to split the list into.
  ///
  /// Example:
  /// ```dart
  /// final splitList = list.split(2);
  /// ```
  List<List<T>> split(int parts) {
    if (parts < 1 || isEmpty) {
      return <List<T>>[];
    }

    final int size = (length / parts).ceil();

    return List<List<T>>.generate(
      parts,
      (int i) => sublist(
        size * i,
        (i + 1) * size <= length ? (i + 1) * size : null,
      ),
    );
  }

  /// Flattens a list of lists into a single list.
  ///
  /// Example:
  /// ```dart
  /// final flatList = nestedList.flatten;
  /// ```
  List<T> get flatten => expand((T i) => i as List<T>).toList();

  /// Retrieves all values for a given key from a list of maps.
  ///
  /// [key] is the key to pluck values for.
  ///
  /// Example:
  /// ```dart
  /// final ids = list.pluck("id");
  /// ```
  List<T?> pluck(String key) {
    if (isEmpty) {
      return <T>[];
    }
    return whereType<Map<String, T>>()
        .where((map) => map.containsKey(key))
        .map((map) => map[key])
        .toList();
  }

  /// Returns the minimum value in the list.
  ///
  /// Example:
  /// ```dart
  /// final minValue = list.min;
  /// ```
  T get min => sorted().first;

  /// Returns the maximum value in the list.
  ///
  /// Example:
  /// ```dart
  /// final maxValue = list.max;
  /// ```
  T get max => sortedDesc.first;

  /// Calculates the sum of all numeric values in the list.
  ///
  /// Example:
  /// ```dart
  /// final total = list.sum;
  /// ```
  num get sum => whereNumbers.reduce((num a, num b) => a + b);

  /// Calculates the average of all numeric values in the list.
  ///
  /// Example:
  /// ```dart
  /// final average = list.avg;
  /// ```
  num get avg => whereNumbers.sum / whereNumbers.length;

  /// Returns a list containing only the numeric values from the original list.
  ///
  /// Example:
  /// ```dart
  /// final numericValues = list.whereNumbers;
  /// ```
  List<num> get whereNumbers =>
      where((T element) => element is num).cast<num>().toList();

  /// Calculates the median value of all numeric values in the list.
  ///
  /// Example:
  /// ```dart
  /// final medianValue = list.median;
  /// ```
  num get median {
    final List<num> list = whereNumbers.sorted();
    final int middleIndex = list.length ~/ 2;
    if (list.length.isEven) {
      return (list[middleIndex - 1] + list[middleIndex]) / 2;
    } else {
      return list[middleIndex];
    }
  }

  /// Calculates the mode (most frequent value) of all numeric values in the list.
  ///
  /// Example:
  /// ```dart
  /// final modeValue = list.mode;
  /// ```
  num get mode {
    final List<num> list = whereNumbers;
    final Map<num, int> frequencyMap = {};
    for (final num value in list) {
      frequencyMap[value] = (frequencyMap[value] ?? 0) + 1;
    }
    return frequencyMap.entries.reduce((a, b) => a.value > b.value ? a : b).key;
  }

  /// Filters the list to include only the specified keys for map elements.
  ///
  /// [keys] is a list of keys to include.
  ///
  /// Example:
  /// ```dart
  /// final filteredList = list.whereOnly(["name", "age"]);
  /// ```
  List<T> whereOnly(List<String> keys) {
    if (isEmpty) {
      return <T>[];
    }
    return whereType<Map<String, T>>()
        .map((Map<String, T> element) {
          return Map<String, T>.fromEntries(
            element.entries.where((entry) => keys.contains(entry.key)),
          ) as T;
        })
        .where((element) => (element as Map).isNotEmpty)
        .toList();
  }

  /// Filters the list to exclude the specified keys for map elements.
  ///
  /// [keys] is a list of keys to exclude.
  ///
  /// Example:
  /// ```dart
  /// final filteredList = list.whereNotOnly(["id", "createdAt"]);
  /// ```
  List<T> whereNotOnly(List<String> keys) {
    if (isEmpty) {
      return <T>[];
    }
    return whereType<Map<String, T>>()
        .map((Map<String, T> element) {
          return Map<String, T>.fromEntries(
            element.entries.where((entry) => !keys.contains(entry.key)),
          ) as T;
        })
        .where((element) => (element as Map).isNotEmpty)
        .toList();
  }

  /// Filters the list to include only elements where the specified key's value is in the given list.
  ///
  /// [key] is the key to check.
  /// [params] is the list of values to match against.
  ///
  /// Example:
  /// ```dart
  /// final filteredList = list.whereIn("status", ["active", "pending"]);
  /// ```
  List<T> whereIn(String key, List<T> params) {
    if (isEmpty) {
      return <T>[];
    }
    return whereType<Map<T, T>>()
        .where((element) =>
            element.containsKey(key) && params.contains(element[key]))
        .map((e) => e as T)
        .toList();
  }

  /// Filters the list to exclude elements where the specified key's value is in the given list.
  ///
  /// [key] is the key to check.
  /// [params] is the list of values to match against.
  ///
  /// Example:
  /// ```dart
  /// final filteredList = list.whereNotIn("status", ["inactive", "deleted"]);
  /// ```
  List<T> whereNotIn(String key, List<T> params) {
    if (isEmpty) {
      return <T>[];
    }
    return whereType<Map<String, T>>()
        .where((element) =>
            element.containsKey(key) && !params.contains(element[key]))
        .map((e) => e as T)
        .toList();
  }

  /// Filters the list to include only elements where the specified key's value is within the given range.
  ///
  /// [key] is the key to check.
  /// [start] is the lower bound of the range (inclusive).
  /// [end] is the upper bound of the range (inclusive).
  ///
  /// Example:
  /// ```dart
  /// final filteredList = list.whereBetween("age", 18, 30);
  /// ```
  List<T> whereBetween(String key, num start, num end) {
    if (isEmpty) {
      return <T>[];
    }
    return whereType<Map<String, dynamic>>()
        .where((element) =>
            element.containsKey(key) &&
            element[key] is num &&
            (element[key] as num) >= start &&
            (element[key] as num) <= end)
        .map((e) => e as T)
        .toList();
  }

  /// Filters the list to exclude elements where the specified key's value is within the given range.
  ///
  /// [key] is the key to check.
  /// [start] is the lower bound of the range (exclusive).
  /// [end] is the upper bound of the range (exclusive).
  ///
  /// Example:
  /// ```dart
  /// final filteredList = list.whereNotBetween("price", 100, 1000);
  /// ```
  List<T> whereNotBetween(String key, num start, num end) {
    if (isEmpty) {
      return <T>[];
    }
    return whereType<Map<String, dynamic>>()
        .where((element) =>
            element.containsKey(key) &&
            element[key] is num &&
            ((element[key] as num) < start || (element[key] as num) > end))
        .map((e) => e as T)
        .toList();
  }

  /// Checks if any map in the list contains the specified key-value pair.
  ///
  /// [key] is the key to check.
  /// [value] is the value to match.
  ///
  /// Example:
  /// ```dart
  /// final hasAdmin = list.hasKeyValue("role", "admin");
  /// ```
  bool hasKeyValue(String key, T value) => any(
        (T element) =>
            element is Map<T, T> &&
            element.containsKey(key) &&
            element[key] == value,
      );

  /// Checks if any map in the list contains the specified key.
  ///
  /// [key] is the key to check for.
  ///
  /// Example:
  /// ```dart
  /// final hasAgeField = list.hasKey("age");
  /// ```
  bool hasKey(String key) => any(
        (T element) => element is Map<T, T> && element.containsKey(key),
      );

  /// Checks if any map in the list contains the specified value.
  ///
  /// [value] is the value to search for.
  ///
  /// Example:
  /// ```dart
  /// final hasJohnDoe = list.hasValue("John Doe");
  /// ```
  bool hasValue(T value) => any(
        (T element) => element is Map<T, T> && element.containsValue(value),
      );
}
