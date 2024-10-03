import 'package:flutter/material.dart';
import 'package:quickly/quickly.dart';

/// A customizable switch widget with additional features provided by FxSwitch.
class FxSwitch extends StatelessWidget {
  /// Constructs an FxSwitch.
  const FxSwitch({
    required this.value,
    required this.onChanged,
    super.key,
    this.size = 24.0,
    this.activeColor,
    this.inactiveColor,
    this.thumbColor,
    this.duration = const Duration(milliseconds: 200),
    this.curve = Curves.easeInOut,
  });

  /// The current state of the switch.
  final bool value;

  /// Called when the user toggles the switch on or off.
  final ValueChanged<bool> onChanged;

  /// The size of the switch. This affects both height and width.
  final double size;

  /// The color used when the switch is in the "on" position.
  final Color? activeColor;

  /// The color used when the switch is in the "off" position.
  final Color? inactiveColor;

  /// The color of the movable thumb.
  final Color? thumbColor;

  /// The duration of the transition animation.
  final Duration duration;

  /// The curve of the transition animation.
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveActiveColor = activeColor ?? FxColor.primary;
    final effectiveInactiveColor = inactiveColor ?? theme.unselectedWidgetColor;
    final effectiveThumbColor = thumbColor ?? Colors.white;

    return GestureDetector(
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        height: size,
        width: size * 1.875, // Maintain aspect ratio
        duration: duration,
        curve: curve,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size / 2),
          color: value ? effectiveActiveColor : effectiveInactiveColor,
        ),
        child: AnimatedAlign(
          duration: duration,
          curve: curve,
          alignment: value ? Alignment.centerRight : Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.all(
                size * 0.0625), // Small padding for visual appeal
            child: Container(
              width: size * 0.875,
              height: size * 0.875,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: effectiveThumbColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
