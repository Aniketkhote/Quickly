///Int extension to extend List functionality
extension IntExtension on int {
  /// Get Month name
  String getMonthName([bool isShort = false]) {
    switch (this) {
      case 1:
        return isShort ? 'Jan' : 'January';
      case 2:
        return isShort ? 'Feb' : 'February';
      case 3:
        return isShort ? 'Mar' : 'March';
      case 4:
        return isShort ? 'Apr' : 'April';
      case 5:
        return isShort ? 'May' : 'May';
      case 6:
        return isShort ? 'Jun' : 'June';
      case 7:
        return isShort ? 'Jul' : 'July';
      case 8:
        return isShort ? 'Aug' : 'August';
      case 9:
        return isShort ? 'Sept' : 'September';
      case 10:
        return isShort ? 'Oct' : 'October';
      case 11:
        return isShort ? 'Nov' : 'November';
      case 12:
        return isShort ? 'Dec' : 'December';
    }
    return 'Invalid day of month';
  }

  /// Get Week name
  String getWeekName([bool isShort = false]) {
    switch (this) {
      case 1:
        return isShort ? 'Mon' : 'Monday';
      case 2:
        return isShort ? 'tue' : 'Tuesday';
      case 3:
        return isShort ? 'Wed' : 'Wednesday';
      case 4:
        return isShort ? 'thu' : 'Thursday';
      case 5:
        return isShort ? 'Fri' : 'Friday';
      case 6:
        return isShort ? 'Sat' : 'Saturday';
      case 7:
        return isShort ? 'Sun' : 'Sunday';
    }
    return 'Invalid day of week';
  }
}
