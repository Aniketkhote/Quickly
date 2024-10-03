import 'dart:async';

/// Extension on [Duration] to provide utility methods.
extension DurationExtension on Duration {
  /// Delays execution for the specified duration.
  ///
  /// If a [callback] is provided, it will be executed after the delay.
  /// If no callback is provided, it simply waits for the duration.
  ///
  /// Returns a [Future] that completes after the specified duration.
  ///
  /// Example:
  /// ```dart
  /// void main() async {
  ///   final delay = Duration(seconds: 3);
  ///   print('Starting delay of $delay');
  ///   await delay.delay();
  ///   print('Delay completed');
  ///
  ///   print('Starting delay with callback');
  ///   await Duration(milliseconds: 700).delay(() {
  ///     print('Callback executed after 700ms');
  ///   });
  /// }
  /// ```
  Future<void> delay([FutureOr<void> Function()? callback]) async {
    return Future.delayed(this, callback);
  }
}
