import 'package:flutter/material.dart';

///Context extension to extend widget functionality
extension ContextExtension on BuildContext {
  /// similar to [MediaQuery]
  MediaQueryData get mq => MediaQuery.of(this);

  /// Get MediaQuery Screen Width
  double get width => mq.size.width;

  /// Get MediaQuery Screen Height
  double get height => mq.size.height;

  /// Check if the window size is of Mobile Size
  bool get isMobile => width < 850;

  /// Check if the window size is of Tablet Size
  bool get isTablet => width < 1100 && width >= 850;

  /// Check if the window size is of Desktop Size
  bool get isDesktop => width >= 1100;

  /// similar to [MediaQuery.of(context).orientation]
  Orientation get orientation => mq.orientation;

  /// check if device is on landscape mode
  bool get isLandscape => orientation == Orientation.landscape;

  /// check if device is on portrait mode
  bool get isPortrait => orientation == Orientation.portrait;

  /// Platform brightness
  Brightness get brightness => mq.platformBrightness;

  /// If the [ThemeData] of the current [BuildContext] is dark
  bool get isDark => brightness == Brightness.dark;

  /// If the [ThemeData] of the current [BuildContext] is light
  bool get isLight => brightness == Brightness.light;

  /// similar to [Theme.of(context)]
  ThemeData get theme => Theme.of(this);

  /// similar to [Theme.of(context).textTheme]
  TextTheme get textTheme => theme.textTheme;
}
