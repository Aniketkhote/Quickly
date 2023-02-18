import 'package:flutter/material.dart';

enum AnimationType { fade, scale, slide, rotate, custom }

class FxRouteTransition<T> extends PageRouteBuilder<T> {
  FxRouteTransition(
    this.page, {
    this.animationType = AnimationType.fade,
    this.animationValue = 1.0,
    this.reverse = false,
    this.onCompleted,
    this.customTransitionBuilder,
  }) : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            if (animationType == AnimationType.custom) {
              if (customTransitionBuilder == null) {
                throw ArgumentError(
                    "customTransitionBuilder must not be null for a custom transition type");
              }
              return customTransitionBuilder(
                  context, animation, secondaryAnimation, child, reverse);
            }
            return _defaultTransition(animation, secondaryAnimation, child,
                animationType, reverse, animationValue);
          },
          transitionDuration: Duration(milliseconds: 300),
        );

  final Widget page;
  final AnimationType animationType;
  final double animationValue;
  final bool reverse;
  final Function? onCompleted;
  final Widget Function(
          BuildContext, Animation<double>, Animation<double>, Widget, bool)?
      customTransitionBuilder;

  static Widget _defaultTransition(
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
    AnimationType type,
    bool reverse,
    double animationValue,
  ) {
    switch (type) {
      case AnimationType.fade:
        return FadeTransition(
          opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.ease,
            ),
          ),
          child: child,
        );
      case AnimationType.scale:
        return ScaleTransition(
          scale: Tween<double>(begin: 0.0, end: animationValue).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.ease,
            ),
          ),
          child: child,
        );
      case AnimationType.slide:
        return SlideTransition(
          position: Tween<Offset>(
            begin: reverse ? Offset.zero : const Offset(1.0, 0.0),
            end: reverse ? const Offset(-1.0, 0.0) : Offset.zero,
          ).animate(
            CurvedAnimation(parent: animation, curve: Curves.ease),
          ),
          child: child,
        );
      case AnimationType.rotate:
        return RotationTransition(
          turns: Tween<double>(begin: 0.0, end: animationValue).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.ease,
            ),
          ),
          child: child,
        );
      default:
        throw ArgumentError('Invalid animation type');
    }
  }
}
