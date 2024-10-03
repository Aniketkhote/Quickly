import 'package:flutter/material.dart';
import 'package:quickly/quickly.dart';

/// A customizable checkbox widget with smooth animation.
class FxCheckbox extends StatelessWidget {
  /// Constructs a FxCheckbox.
  const FxCheckbox({
    required this.onChanged,
    required this.value,
    super.key,
    this.size = 24.0,
    this.iconSize = 20.0,
    this.backgroundColor,
    this.iconColor,
    this.icon = Icons.check,
    this.borderColor,
    this.duration = const Duration(milliseconds: 200),
    this.curve = Curves.easeInOut,
  });

  /// The size of the checkbox.
  final double size;

  /// The size of the checkbox icon.
  final double iconSize;

  /// Callback function called when the checkbox state changes.
  final ValueChanged<bool> onChanged;

  /// The background color of the checkbox when checked.
  final Color? backgroundColor;

  /// The color of the checkbox icon.
  final Color? iconColor;

  /// The icon displayed when the checkbox is checked.
  final IconData icon;

  /// The color of the checkbox border.
  final Color? borderColor;

  /// Indicates whether the checkbox is checked or not.
  final bool value;

  /// The duration of the animation when the checkbox state changes.
  final Duration duration;

  /// The curve of the animation when the checkbox state changes.
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    final effectiveBackgroundColor = backgroundColor ?? FxColor.primary;
    final effectiveBorderColor = borderColor ?? effectiveBackgroundColor;
    final effectiveIconColor = iconColor ?? Colors.white;

    return GestureDetector(
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        height: size,
        width: size,
        duration: duration,
        curve: curve,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: value ? effectiveBackgroundColor : Colors.transparent,
          border: Border.all(color: effectiveBorderColor),
        ),
        child: value
            ? Icon(
                icon,
                color: effectiveIconColor,
                size: iconSize,
              )
            : null,
      ),
    );
  }
}
