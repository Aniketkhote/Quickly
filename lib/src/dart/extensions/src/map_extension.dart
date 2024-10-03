/// Extension on [Map] to provide additional functionality and utility methods.
///
/// This extension enhances the capabilities of [Map<T, T>] by adding methods for:
/// - Checking key-value pair existence
/// - Retrieving and casting values to specific types
/// - Manipulating the map based on keys or values
/// - Comparing maps
/// - Safely accessing values with type-specific getters
///
/// These methods aim to simplify common map operations and provide more robust
/// ways of working with map data in Dart.
extension MapExtension<T> on Map<T, T> {
  /// Checks if the map contains the given [key]/[value] pair.
  ///
  /// This method verifies both the existence of the key and the equality of its value.
  ///
  /// Example:
  /// ```dart
  /// Map<String, dynamic> map = {'id': 1, 'name': 'Desk', 'price': 200};
  /// print(map.has("id", 1)); // true
  /// print(map.has("id", 2)); // false
  /// ```
  ///
  /// @param key The key to check for in the map.
  /// @param value The value to compare against the key's value.
  /// @return True if the key exists and its value matches the given value, false otherwise.
  bool has(String key, dynamic value) => containsKey(key) && this[key] == value;

  /// Checks if the map does not contain the given [key]/[value] pair.
  ///
  /// This is the inverse of the [has] method.
  ///
  /// Example:
  /// ```dart
  /// Map<String, dynamic> map = {"name": "John", "age": 30};
  /// print(map.doesntHave("gender", "male")); // true
  /// print(map.doesntHave("name", "John")); // false
  /// ```
  ///
  /// @param key The key to check for in the map.
  /// @param value The value to compare against the key's value.
  /// @return True if the key doesn't exist or its value doesn't match the given value, false otherwise.
  bool doesntHave(String key, T value) => !has(key, value);

  /// Removes key/value pairs from the map whose keys are not in the given [keys] list.
  ///
  /// This method modifies the original map and returns it.
  ///
  /// Example:
  /// ```dart
  /// Map<String, dynamic> map = {"id": 1, "name": "John", "age": 30};
  /// var newMap = map.retainKeys(["id", "name"]);
  /// print(newMap); // {"id": 1, "name": "John"}
  /// ```
  ///
  /// @param keys List of keys to retain in the map.
  /// @return The modified map containing only the key/value pairs with keys present in [keys].
  Map<T, T> retainKeys(List<T> keys) {
    removeWhere((T key, T value) => !keys.contains(key));
    return this;
  }

  /// Retrieves the value associated with the 'id' key, if it exists.
  ///
  /// If the 'id' key doesn't exist or its value is neither a number nor a string,
  /// the method returns the provided [defaultValue] or null.
  ///
  /// Example:
  /// ```dart
  /// Map<String, dynamic> map = {'id': 111, 'name': 'Desk'};
  /// var id = map.getId();
  /// print(id); // Output: 111
  ///
  /// Map<String, dynamic> map2 = {'name': 'Chair'};
  /// var id2 = map2.getId(defaultValue: 0);
  /// print(id2); // Output: 0
  /// ```
  ///
  /// @param defaultValue The value to return if 'id' is not found or invalid.
  /// @return The value of 'id' if it exists and is valid, otherwise [defaultValue] or null.
  T? getId({T? defaultValue}) {
    T? value = containsKey('id') ? this['id'] : defaultValue;
    if (value != null && (value is num || value is String)) {
      return value as T;
    }
    return defaultValue;
  }

  /// Returns a new map containing entries from this map that are not in [map].
  ///
  /// The comparison is based on keys.
  ///
  /// Example:
  /// ```dart
  /// var map1 = {'a': 1, 'b': 2, 'c': 3};
  /// var map2 = {'b': 2, 'c': 4, 'd': 5};
  /// print(map1.diffKeys(map2)); // {'a': 1}
  /// ```
  ///
  /// @param map The map to compare against.
  /// @return A new map containing entries not present in [map] based on keys.
  Map<T, T> diffKeys<K, V>(Map<K, V> map) {
    return Map<T, T>.fromEntries(
      entries.where((entry) => !map.containsKey(entry.key)),
    );
  }

  /// Returns a new map containing entries from this map that are not in [map].
  ///
  /// The comparison is based on values.
  ///
  /// Example:
  /// ```dart
  /// var map1 = {'a': 1, 'b': 2, 'c': 3};
  /// var map2 = {'x': 2, 'y': 3, 'z': 4};
  /// print(map1.diffValues(map2)); // {'a': 1}
  /// ```
  ///
  /// @param map The map to compare against.
  /// @return A new map containing entries not present in [map] based on values.
  Map<T, T> diffValues(Map<T, T> map) {
    return Map<T, T>.fromEntries(
      entries.where((entry) => !map.containsValue(entry.value)),
    );
  }

  /// Retrieves a boolean value for the given [key].
  ///
  /// If the key is not present or its value is not a boolean, returns false.
  ///
  /// Example:
  /// ```dart
  /// Map<String, dynamic> map = {'isAdmin': true, 'isActive': false};
  /// print(map.getBool('isAdmin'));  // true
  /// print(map.getBool('isActive')); // false
  /// print(map.getBool('isDeleted')); // false
  /// ```
  ///
  /// @param key The key to look up in the map.
  /// @return The boolean value associated with [key], or false if not found or not a boolean.
  bool getBool(String key) =>
      containsKey(key) && this[key] is bool ? this[key] as bool : false;

  /// Retrieves an integer value for the given [key].
  ///
  /// If the key is not present or its value cannot be parsed as an integer,
  /// returns the [defaultValue] or null.
  ///
  /// Example:
  /// ```dart
  /// Map<String, dynamic> map = {'id': 11, 'name': 'John Doe', 'age': '30'};
  /// print(map.getInt('id')); // 11
  /// print(map.getInt('age')); // 30
  /// print(map.getInt('salary', defaultValue: 0)); // 0
  /// ```
  ///
  /// @param key The key to look up in the map.
  /// @param defaultValue The value to return if the key is not found or its value is not an integer.
  /// @return The integer value associated with [key], the [defaultValue], or null.
  int? getInt(String key, {int? defaultValue}) => containsKey(key)
      ? int.tryParse('${this[key]}') ?? defaultValue
      : defaultValue;

  /// Retrieves a double value for the given [key].
  ///
  /// If the key is not present or its value cannot be parsed as a double,
  /// returns the [defaultValue] or null.
  ///
  /// Example:
  /// ```dart
  /// Map<String, dynamic> map = {'price': 27.32, 'qty': '27.32', 'inStock': true};
  /// print(map.getDouble('price')); // 27.32
  /// print(map.getDouble('qty')); // 27.32
  /// print(map.getDouble('discount', defaultValue: 0.0)); // 0.0
  /// ```
  ///
  /// @param key The key to look up in the map.
  /// @param defaultValue The value to return if the key is not found or its value is not a double.
  /// @return The double value associated with [key], the [defaultValue], or null.
  double? getDouble(String key, {double? defaultValue}) => containsKey(key)
      ? double.tryParse('${this[key]}') ?? defaultValue
      : defaultValue;

  /// Retrieves a string value for the given [key].
  ///
  /// If the key is not present or its value is not a string,
  /// returns the [defaultValue] or null.
  ///
  /// Example:
  /// ```dart
  /// Map<String, dynamic> map = {'username': 'thor', 'age': 35};
  /// print(map.getString('username')); // 'thor'
  /// print(map.getString('email', defaultValue: 'not_provided@example.com')); // 'not_provided@example.com'
  /// ```
  ///
  /// @param key The key to look up in the map.
  /// @param defaultValue The value to return if the key is not found or its value is not a string.
  /// @return The string value associated with [key], the [defaultValue], or null.
  String? getString(String key, {String? defaultValue}) =>
      this[key] is String ? this[key] as String : defaultValue;

  /// Retrieves a list of type [T] for the given [key].
  ///
  /// If the key is not present or its value is not a list of type [T],
  /// returns an empty list.
  ///
  /// Example:
  /// ```dart
  /// Map<String, dynamic> map = {'items': [1, 2, 3, 4], 'prices': [20.0, 30.0, 40.0]};
  /// print(map.getList<int>('items')); // [1, 2, 3, 4]
  /// print(map.getList<double>('prices')); // [20.0, 30.0, 40.0]
  /// print(map.getList<String>('names')); // []
  /// ```
  ///
  /// @param key The key to look up in the map.
  /// @return The list of type [T] associated with [key], or an empty list if not found or not of type List<T>.
  List<T> getList<K>(String key) =>
      containsKey(key) && this[key] is List<T> ? this[key] as List<T> : <T>[];

  /// Retrieves the value associated with [condition] key.
  ///
  /// If the key is not found, returns [byDefault].
  ///
  /// Example:
  /// ```dart
  /// Map<String, String> map = {'apple': 'red', 'banana': 'yellow', 'orange': 'orange'};
  /// print(map.match('apple')); // 'red'
  /// print(map.match('grape', 'Not found')); // 'Not found'
  /// ```
  ///
  /// @param condition The key to look up in the map.
  /// @param byDefault The default value to return if the key is not found.
  /// @return The value associated with [condition], or [byDefault] if not found.
  Object? match(T condition, [String? byDefault = 'Invalid input']) =>
      containsKey(condition) ? this[condition] : byDefault;

  /// Creates a new map containing only the specified [keys] from this map.
  ///
  /// Example:
  /// ```dart
  /// Map<String, String> map = {'apple': 'red', 'banana': 'yellow', 'orange': 'orange'};
  /// print(map.pick(['apple', 'orange'])); // {'apple': 'red', 'orange': 'orange'}
  /// ```
  ///
  /// @param keys The list of keys to include in the new map.
  /// @return A new map containing only the key-value pairs for the specified [keys].
  Map<T, T> pick(List<T> keys) {
    return Map<T, T>.fromEntries(
      entries.where((entry) => keys.contains(entry.key)),
    );
  }

  /// Creates a new map excluding entries with null values from this map.
  ///
  /// Example:
  /// ```dart
  /// final map = {'a': 1, 'b': null, 'c': 3};
  /// print(map.removeNullValues()); // {'a': 1, 'c': 3}
  /// ```
  ///
  /// @return A new map containing all non-null entries from this map.
  Map<T, T> removeNullValues() {
    return Map<T, T>.fromEntries(entries.where((entry) => entry.value != null));
  }
}
