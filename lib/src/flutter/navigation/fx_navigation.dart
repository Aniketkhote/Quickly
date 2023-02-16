import 'package:flutter/material.dart';
import './fx_animation.dart';

class FxNavigation {
  FxNavigation({required GlobalKey<NavigatorState> key}) : _navigatorKey = key;
  final GlobalKey<NavigatorState> _navigatorKey;

  NavigatorState? get navigator => _navigatorKey.currentState;
  BuildContext get context {
    final BuildContext? context = _navigatorKey.currentContext;
    if (context == null) {
      throw Exception("The context is not available.");
    }
    return context;
  }

  dynamic get arguments => ModalRoute.of(context)!.settings.arguments;

  Future<Object?>? toNamed({
    required String routeName,
    Object? arguments,
  }) =>
      navigator?.pushNamed(routeName, arguments: arguments);

  Future<Object?>? toPage({
    required Widget page,
    AnimationType animationType = AnimationType.fade,
    double animationValue = 1.0,
    Function? onCompleted,
  }) {
    return navigator?.push(FxRouteTransition<Object>(
      page: page,
      animationType: animationType,
      animationValue: animationValue,
      onCompleted: onCompleted,
    ));
  }

  Future<Object?>? offPage({
    required Widget page,
    AnimationType animationType = AnimationType.fade,
    double animationValue = 1.0,
    Function? onCompleted,
  }) =>
      navigator?.pushReplacement(FxRouteTransition<Object>(
        page: page,
        animationType: animationType,
        animationValue: animationValue,
        reverse: true,
        onCompleted: onCompleted,
      ));

  Future<Object?>? offNamed({
    required String routeName,
    Object? arguments,
    Function? onCompleted,
  }) =>
      navigator?.pushReplacementNamed(routeName, arguments: arguments);

  void back() => navigator?.pop();

  bool? canPop() => navigator?.canPop();

  void maybePop<T extends Object>([T? result]) => navigator?.maybePop(result);

  void navigateTo(Widget page,
      {AnimationType animationType = AnimationType.fade,
      double animationValue = 1.0,
      Function? onCompleted,
      bool replace = false}) {
    if (replace) {
      offPage(
          page: page,
          animationType: animationType,
          animationValue: animationValue,
          onCompleted: onCompleted);
    } else {
      toPage(
          page: page,
          animationType: animationType,
          animationValue: animationValue,
          onCompleted: onCompleted);
    }
  }
}
