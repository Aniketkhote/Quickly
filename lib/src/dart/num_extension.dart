///Num extension to extend List functionality
extension NumExt on num {
  /// Add suffix to the number
  String suffix([String suffix = '']) {
    if (suffix.isNotEmpty) return '${this}$suffix';
    switch (this % 10) {
      case 1:
        return '${this}st';
      case 2:
        return '${this}nd';
      case 3:
        return '${this}rd';
    }
    return '${this}th';
  }
}
