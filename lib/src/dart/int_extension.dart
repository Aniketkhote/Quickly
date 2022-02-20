import 'extensions.dart';

///Int extension to extend List functionality
extension IntExtension on int {
  /// Get Month name from number
  ///
  /// Example:
  /// ```dart
  /// 1.getMonthName()         // January
  /// 2.getMonthName(true)    // Feb
  /// ```
  String getMonthName([bool isShort = false]) => <int, String>{
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
      }.match(this, 'Invalid number of month');

  /// Get Week name from number
  ///
  /// Example:
  /// ```dart
  /// 1.getWeekName()         // Monday
  /// 2.getWeekName(true)    // Tue
  /// ```
  String getWeekName([bool isShort = false]) => <int, String>{
        1: isShort ? 'Mon' : 'Monday',
        2: isShort ? 'Tue' : 'Tuesday',
        3: isShort ? 'Wed' : 'Wednesday',
        4: isShort ? 'Thu' : 'Thursday',
        5: isShort ? 'Fri' : 'Friday',
        6: isShort ? 'Sat' : 'Saturday',
        7: isShort ? 'Sun' : 'Sunday',
      }.match(this, 'Invalid day of week');
}
