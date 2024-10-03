import "package:flutter/material.dart";
import "package:quickly/quickly.dart";

/// A customizable radio button widget with smooth animation and additional features.
class FxRadio<T> extends StatelessWidget {
  /// Constructs an FxRadio.
  const FxRadio({
    required this.groupValue,
    required this.value,
    required this.onChanged,
    super.key,
    this.size = 24.0,
    this.activeColor,
    this.inactiveColor,
    this.borderColor,
    this.duration = const Duration(milliseconds: 200),
    this.curve = Curves.easeInOut,
  });

  /// The value of the currently selected radio button in the group.
  final T groupValue;

  /// The value represented by this radio button.
  final T value;

  /// Called when the user selects this radio button.
  final ValueChanged<T> onChanged;

  /// The size of the radio button.
  final double size;

  /// The color used when the radio button is selected.
  final Color? activeColor;

  /// The color used when the radio button is not selected.
  final Color? inactiveColor;

  /// The color of the radio button border.
  final Color? borderColor;

  /// The duration of the animation when the radio button state changes.
  final Duration duration;

  /// The curve of the animation when the radio button state changes.
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    final isSelected = groupValue == value;
    final effectiveActiveColor = activeColor ?? FxColor.primary;
    final effectiveInactiveColor = inactiveColor ?? Colors.transparent;
    final effectiveBorderColor =
        borderColor ?? (isSelected ? effectiveActiveColor : Colors.grey);

    return GestureDetector(
      onTap: () => onChanged(value),
      child: AnimatedContainer(
        width: size,
        height: size,
        duration: duration,
        curve: curve,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: effectiveBorderColor),
          color: isSelected ? effectiveActiveColor : effectiveInactiveColor,
        ),
        child: isSelected
            ? Center(
                child: Container(
                  width: size * 0.5,
                  height: size * 0.5,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
