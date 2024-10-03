/// Extension on [int] providing additional functionality for working with months and weeks.
extension IntExtension on int {
  /// Returns the name of a month corresponding to the integer value.
  ///
  /// This method assumes that the integer represents a month number (1-12).
  /// If the integer is outside this range, it returns 'Invalid number of month'.
  ///
  /// Parameters:
  /// - [isShort]: If true, returns the abbreviated month name. Defaults to false.
  ///
  /// Returns:
  /// A [String] representing the month name.
  ///
  /// Example:
  /// ```dart
  /// print(1.getMonthName()); // Output: January
  /// print(3.getMonthName(isShort: true)); // Output: Mar
  /// print(13.getMonthName()); // Output: Invalid number of month
  /// ```
  String getMonthName({bool isShort = false}) {
    final Map<int, String> monthNames = <int, String>{
      1: isShort ? 'Jan' : 'January',
      2: isShort ? 'Feb' : 'February',
      3: isShort ? 'Mar' : 'March',
      4: isShort ? 'Apr' : 'April',
      5: 'May',
      6: isShort ? 'Jun' : 'June',
      7: isShort ? 'Jul' : 'July',
      8: isShort ? 'Aug' : 'August',
      9: isShort ? 'Sep' : 'September',
      10: isShort ? 'Oct' : 'October',
      11: isShort ? 'Nov' : 'November',
      12: isShort ? 'Dec' : 'December',
    };

    return monthNames[this] ?? 'Invalid number of month';
  }

  /// Returns the name of a week day corresponding to the integer value.
  ///
  /// This method assumes that the integer represents a day of the week (1-7),
  /// where 1 is Monday and 7 is Sunday. If the integer is outside this range,
  /// it returns 'Invalid number of week'.
  ///
  /// Parameters:
  /// - [isShort]: If true, returns the abbreviated day name. Defaults to false.
  ///
  /// Returns:
  /// A [String] representing the day name.
  ///
  /// Example:
  /// ```dart
  /// print(1.getWeekName()); // Output: Monday
  /// print(5.getWeekName(isShort: true)); // Output: Fri
  /// print(8.getWeekName()); // Output: Invalid number of week
  /// ```
  String getWeekName({bool isShort = false}) {
    final Map<int, String> weekNames = <int, String>{
      1: isShort ? 'Mon' : 'Monday',
      2: isShort ? 'Tue' : 'Tuesday',
      3: isShort ? 'Wed' : 'Wednesday',
      4: isShort ? 'Thu' : 'Thursday',
      5: isShort ? 'Fri' : 'Friday',
      6: isShort ? 'Sat' : 'Saturday',
      7: isShort ? 'Sun' : 'Sunday',
    };

    return weekNames[this] ?? 'Invalid number of week';
  }
}
