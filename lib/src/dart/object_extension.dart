extension ObjectExtension<T> on Object {
  /// The match() function also works similarly to switch
  ///
  /// i.e, it finds the matching case according to the parameter passed in it.
  T match(Map<dynamic, dynamic> map, [String byDefault = 'Invalid input']) =>
      map.containsKey(this) ? map[this] : byDefault;
}
