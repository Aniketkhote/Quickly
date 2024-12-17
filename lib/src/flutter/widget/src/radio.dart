import 'package:flutter/material.dart';

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
    this.innerCircleColor,
    this.innerCircleScale = 0.5,
    this.duration = const Duration(milliseconds: 200),
    this.curve = Curves.easeInOut,
    this.isDisabled = false,
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

  /// The color of the inner circle when the radio button is selected.
  final Color? innerCircleColor;

  /// The scale factor for the inner circle (relative to the radio button size).
  final double innerCircleScale;

  /// The duration of the animation when the radio button state changes.
  final Duration duration;

  /// The curve of the animation when the radio button state changes.
  final Curve curve;

  /// Whether the radio button is disabled.
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    final isSelected = groupValue == value;
    final effectiveActiveColor = activeColor ?? Theme.of(context).primaryColor;
    final effectiveInactiveColor = inactiveColor ?? Colors.transparent;
    final effectiveBorderColor =
        borderColor ?? (isSelected ? effectiveActiveColor : Colors.grey);
    final effectiveInnerCircleColor =
        innerCircleColor ?? Colors.white.withValues(alpha: 0.9);

    return Opacity(
      opacity: isDisabled ? 0.5 : 1.0,
      child: Semantics(
        selected: isSelected,
        button: true,
        child: InkWell(
          onTap: isDisabled ? null : () => onChanged(value),
          borderRadius: BorderRadius.circular(size / 2),
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
            child: Center(
              child: AnimatedScale(
                scale: isSelected ? innerCircleScale : 0.0,
                duration: duration,
                curve: curve,
                child: Container(
                  width: size,
                  height: size,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: effectiveInnerCircleColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
