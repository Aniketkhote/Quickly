import 'package:flutter/material.dart';
import 'extensions.dart';

///Num extension to extend List functionality
extension NumExtension on num {
  /// Add suffix to the number
  String suffix([String suffix = '']) {
    if (suffix.isNotEmpty) return '${this}$suffix';

    return (this % 10).match(<int, String>{
      1: '${this}st',
      2: '${this}nd',
      3: '${this}rd',
    }, '${this}th');
  }

  ///Creates a fixed sized square box.
  SizedBox sq(Widget child) => _sizedBox(child, h: toDouble(), w: toDouble());

  ///Creates a fixed sized height box.
  SizedBox h(Widget child) => _sizedBox(child, h: toDouble());

  ///Creates a fixed sized width box.
  SizedBox w(Widget child) => _sizedBox(child, w: toDouble());

  SizedBox _sizedBox(Widget child, {double? h, double? w}) =>
      SizedBox(child: child, height: h, width: w);

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
