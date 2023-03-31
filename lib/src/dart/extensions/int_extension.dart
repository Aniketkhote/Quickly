/// IntExtension is an extension method on the int class that provides additional functionality for working with months and weeks.
extension IntExtension on int {
  /// Extension method to get the name of a month from a given number.
  ///
  /// Example usage:
  /// ```dart
  /// 1.getMonthName() => "January"
  /// 2.getMonthName(true) => "Feb"
  /// ```
  ///
  /// @param [isShort] If true, returns the short form of the month name. Default is false.
  /// @return Returns the name of the month as a string. If the input number is not a valid month, returns "Invalid number of month".
  String getMonthName([bool isShort = false]) {
    final Map<int, String> monthNames = <int, String>{
      1: isShort ? 'Jan' : 'January',
      2: isShort ? 'Feb' : 'February',
      3: isShort ? 'Mar' : 'March',
      4: isShort ? 'Apr' : 'April',
      5: isShort ? 'May' : 'May',
      6: isShort ? 'Jun' : 'June',
      7: isShort ? 'Jul' : 'July',
      8: isShort ? 'Aug' : 'August',
      9: isShort ? 'Sept' : 'September',
      10: isShort ? 'Oct' : 'October',
      11: isShort ? 'Nov' : 'November',
      12: isShort ? 'Dec' : 'December',
    };

    return monthNames[this] ?? 'Invalid number of month';
  }

  /// Extension method to get the name of a week from a given number.
  ///
  /// Example usage:
  /// ```dart
  /// 1.getWeekName() => "Monday"
  /// 2.getWeekName(true) => "Tue"
  /// ```
  ///
  /// @param [isShort] If true, returns the short form of the week name. Default is false.
  /// @return Returns the name of the week as a string. If the input number is not a valid week, returns "Invalid number of week".
  String getWeekName([bool isShort = false]) {
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
