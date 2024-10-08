/// An extension on the [DateTime] class that provides methods for formatting
/// and comparing dates in human-readable formats.
extension DateTimeExtension on DateTime {
  /// Formats the DateTime object as a string based on the provided [format].
  ///
  /// Supported format tokens:
  /// - 'dd': Day of the month (01-31)
  /// - 'MM': Month (01-12)
  /// - 'MMM': Short month name (Jan-Dec)
  /// - 'MMMM': Full month name (January-December)
  /// - 'yyyy': Year
  /// - 'HH': Hour (00-23)
  /// - 'hh': Hour (01-12)
  /// - 'mm': Minute (00-59)
  /// - 'ss': Second (00-59)
  /// - 'a': AM/PM marker
  /// - 'EEE': Short day name (Mon-Sun)
  /// - 'EEEE': Full day name (Monday-Sunday)
  ///
  /// Example usage:
  /// ```dart
  /// DateTime now = DateTime.now();
  /// String formattedDate = now.format('dd/MM/yyyy');
  /// ```
  ///
  /// @param format The format string to use for formatting the date.
  /// @return A formatted string representation of the date.
  String format(String format) {
    final Map<String, String> shortMonths = {
      '01': 'Jan',
      '02': 'Feb',
      '03': 'Mar',
      '04': 'Apr',
      '05': 'May',
      '06': 'Jun',
      '07': 'Jul',
      '08': 'Aug',
      '09': 'Sep',
      '10': 'Oct',
      '11': 'Nov',
      '12': 'Dec'
    };

    final Map<String, String> fullMonths = {
      '01': 'January',
      '02': 'February',
      '03': 'March',
      '04': 'April',
      '05': 'May',
      '06': 'June',
      '07': 'July',
      '08': 'August',
      '09': 'September',
      '10': 'October',
      '11': 'November',
      '12': 'December'
    };

    final Map<String, String> shortDays = {
      '1': 'Mon',
      '2': 'Tue',
      '3': 'Wed',
      '4': 'Thu',
      '5': 'Fri',
      '6': 'Sat',
      '7': 'Sun'
    };

    final Map<String, String> fullDays = {
      '1': 'Monday',
      '2': 'Tuesday',
      '3': 'Wednesday',
      '4': 'Thursday',
      '5': 'Friday',
      '6': 'Saturday',
      '7': 'Sunday'
    };

    return format.replaceAllMapped(
      RegExp(r'(dd|MM|MMM|MMMM|yyyy|HH|hh|mm|ss|a|EEE|EEEE|[^\w])'),
      (Match m) {
        switch (m.group(0)) {
          case 'dd':
            return this.day.toString().padLeft(2, '0');
          case 'MM':
            return this.month.toString().padLeft(2, '0');
          case 'MMM':
            return shortMonths[this.month.toString().padLeft(2, '0')]!;
          case 'MMMM':
            return fullMonths[this.month.toString().padLeft(2, '0')]!;
          case 'yyyy':
            return this.year.toString();
          case 'HH':
            return this.hour.toString().padLeft(2, '0');
          case 'hh':
            int hour = this.hour > 12 ? this.hour - 12 : this.hour;
            return hour.toString().padLeft(2, '0');
          case 'mm':
            return this.minute.toString().padLeft(2, '0');
          case 'ss':
            return this.second.toString().padLeft(2, '0');
          case 'a':
            return this.hour < 12 ? 'AM' : 'PM';
          case 'EEE':
            return shortDays[this.weekday.toString()]!;
          case 'EEEE':
            return fullDays[this.weekday.toString()]!;
          default:
            return m.group(0)!;
        }
      },
    );
  }

  /// Checks if the DateTime object represents a date in the past.
  ///
  /// @return True if the date is in the past, false otherwise.
  bool isPast() {
    return this.isBefore(DateTime.now());
  }

  /// Checks if the DateTime object represents a date in the future.
  ///
  /// @return True if the date is in the future, false otherwise.
  bool isFuture() {
    return this.isAfter(DateTime.now());
  }

  /// Returns a human-readable string representation of the difference between
  /// this date and the current date.
  ///
  /// Optional parameters:
  ///   - [abbreviatedUnits]: If `true`, displays abbreviated units. Default is `false`.
  ///   - [showRelativeDates]: If `true`, displays relative dates for time differences within a day (e.g., "today", "yesterday"). Default is `false`.
  ///   - [precision]: Specifies the number of units to display for the time difference. Default is `2`.
  ///
  /// Examples:
  /// ```dart
  /// DateTime dateTime = DateTime(2023, 5, 10, 15, 30);
  /// print(dateTime.timeAgo()); // Output: "2 days ago"
  ///
  /// DateTime pastDateTime = DateTime(2022, 10, 1);
  /// print(pastDateTime.timeAgo(showRelativeDates: true)); // Output: "7 months ago"
  /// ```
  ///
  /// @param abbreviatedUnits Whether to use abbreviated units.
  /// @param showRelativeDates Whether to show relative dates for recent times.
  /// @param precision The number of units to display in the result.
  /// @return A human-readable string representing the time difference.
  String timeAgo({
    bool abbreviatedUnits = false,
    bool showRelativeDates = false,
    int precision = 2,
  }) {
    final DateTime now = DateTime.now();
    final Duration difference = now.difference(this);
    final int seconds = difference.inSeconds;
    final int minutes = difference.inMinutes;
    final int hours = difference.inHours;
    final int days = difference.inDays;

    if (showRelativeDates && difference.abs().inDays < 2) {
      if (difference.isNegative) {
        return 'yesterday';
      } else if (difference.inDays == 0) {
        return 'today';
      } else {
        return 'tomorrow';
      }
    }

    if (seconds < 5) {
      return 'just now';
    } else if (seconds < 60) {
      return '$seconds${abbreviatedUnits ? 's' : ' seconds'} ago';
    } else if (minutes < 60) {
      return '$minutes${abbreviatedUnits ? 'm' : ' minutes'} ago';
    } else if (hours < 24) {
      return '${_formatUnit(hours, abbreviatedUnits, 'hour')} ago';
    } else if (days < 30) {
      return '${_formatUnit(days, abbreviatedUnits, 'day')} ago';
    } else if (days < 365) {
      final int months = _calculateMonths(now, this);
      return '${_formatUnit(months, abbreviatedUnits, 'month')} ago';
    } else {
      final int years = days ~/ 365;
      return '${_formatUnit(years, abbreviatedUnits, 'year')} ago';
    }
  }

  /// Formats a unit count with its appropriate label.
  ///
  /// @param count The number of units.
  /// @param abbreviated Whether to use abbreviated unit labels.
  /// @param unit The base unit name (e.g., 'day', 'hour').
  /// @return A formatted string representing the count and unit.
  String _formatUnit(int count, bool abbreviated, String unit) {
    final String pluralUnit =
        abbreviated ? '${unit[0]}${unit[1]}' : '$unit${count != 1 ? 's' : ''}';
    if (count == 1) {
      return '1 $pluralUnit';
    } else {
      return '$count $pluralUnit';
    }
  }

  /// Calculates the number of months between two dates.
  ///
  /// @param now The current date.
  /// @param dateTime The date to compare against.
  /// @return The number of months between the two dates.
  int _calculateMonths(DateTime now, DateTime dateTime) =>
      (now.year - dateTime.year) * 12 + now.month - dateTime.month;
}
