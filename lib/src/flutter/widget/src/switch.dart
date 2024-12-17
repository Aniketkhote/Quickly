import 'package:flutter/material.dart';
import 'package:quickly/quickly.dart';

/// A customizable switch widget with smooth animations and additional features.
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
    this.borderColor,
    this.isDisabled = false,
    this.duration = const Duration(milliseconds: 200),
    this.curve = Curves.easeInOut,
  });

  /// The current state of the switch.
  final bool value;

  /// Called when the user toggles the switch on or off.
  final ValueChanged<bool> onChanged;

  /// The size of the switch. Affects height, width, and thumb size.
  final double size;

  /// The color used when the switch is in the "on" position.
  final Color? activeColor;

  /// The color used when the switch is in the "off" position.
  final Color? inactiveColor;

  /// The color of the movable thumb.
  final Color? thumbColor;

  /// The border color of the switch.
  final Color? borderColor;

  /// Whether the switch is disabled.
  final bool isDisabled;

  /// The duration of the transition animation.
  final Duration duration;

  /// The curve of the transition animation.
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveActiveColor = activeColor ?? FxColor.primary;
    final effectiveInactiveColor =
        inactiveColor ?? theme.unselectedWidgetColor.withValues(alpha: 0.5);
    final effectiveThumbColor = thumbColor ?? Colors.white;
    final effectiveBorderColor =
        borderColor ?? Colors.grey.withValues(alpha: 0.5);

    return Opacity(
      opacity: isDisabled ? 0.5 : 1.0,
      child: Semantics(
        label: 'Switch',
        value: value ? 'On' : 'Off',
        enabled: !isDisabled,
        child: InkWell(
          onTap: isDisabled ? null : () => onChanged(!value),
          borderRadius: BorderRadius.circular(size / 2),
          child: AnimatedContainer(
            height: size,
            width: size * 1.875,
            duration: duration,
            curve: curve,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(size / 2),
              color: value ? effectiveActiveColor : effectiveInactiveColor,
              border: Border.all(
                color: effectiveBorderColor,
                width: 1.5,
              ),
            ),
            child: AnimatedAlign(
              duration: duration,
              curve: curve,
              alignment: value ? Alignment.centerRight : Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(size * 0.08),
                child: AnimatedScale(
                  duration: duration,
                  scale: value ? 1.1 : 1.0,
                  curve: curve,
                  child: Container(
                    width: size * 0.875,
                    height: size * 0.875,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: effectiveThumbColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
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
