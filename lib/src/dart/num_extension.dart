///Num extension to extend List functionality
extension NumExtension on num {
  /// Add suffix to the number
  String suffix([String suffix = '']) {
    if (suffix.isNotEmpty) return '${this}$suffix';
    return <int, String>{
          1: '${this}st',
          2: '${this}nd',
          3: '${this}rd',
        }[this % 10] ??
        '${this}th';
  }

  ///Returns Duration of this in seconds.
  Duration get seconds => Duration(seconds: this as int);

  ///Returns Duration of this in milliseconds.
  Duration get milliseconds => Duration(milliseconds: this as int);

  ///Returns Duration of this in microseconds.
  Duration get microseconds => Duration(microseconds: this as int);

  ///Returns Duration of this in minutes.
  Duration get minutes => Duration(minutes: this as int);

  ///Returns Duration of this in hours.
  Duration get hours => Duration(hours: this as int);

  ///Returns Duration of this in days.
  Duration get days => Duration(days: this as int);
}
