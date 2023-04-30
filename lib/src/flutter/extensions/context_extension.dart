import 'package:flutter/material.dart';

///Context extension to extend widget functionality
extension ContextExtension on BuildContext {
  /// similar to [MediaQuery.of(this)]
  MediaQueryData get mq => MediaQuery.of(this);

  /// Get MediaQuery Screen Width
  double get width => mq.size.width;

  /// Get MediaQuery Screen Height
  double get height => mq.size.height;

  /// Check if the window size is of Mobile Size
  bool get isMobile => width < 650;

  /// Check if the window size is of Tablet Size
  bool get isTablet => width < 1100 && width >= 650;

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

  /// Returns the nearest ancestor [Navigator] widget.
  NavigatorState get navigator => Navigator.of(this);

  /// Shows a [SnackBar] with the given message
  void showSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  /// Provides a shortcut to push a new route to the navigator.
  ///
  /// This is equivalent to calling `Navigator.of(context).push()`.
  Future<T?> push<T extends Object>(Route<T> route) => navigator.push(route);

  /// Provides a shortcut to push a named route to the navigator.
  ///
  /// This is equivalent to calling `Navigator.of(context).pushNamed()`.
  Future<T?> pushNamed<T extends Object?>(String routeName,
          {Object? arguments}) =>
      navigator.pushNamed<T>(routeName, arguments: arguments);

  /// Provides a shortcut to pop the current route off the navigator.
  ///
  /// This is equivalent to calling `Navigator.of(context).pop()`.
  void pop<T extends Object?>([T? result]) => navigator.pop<T>(result);
}
