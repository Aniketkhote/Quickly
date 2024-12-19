import 'package:flutter/material.dart';

class FxCheckbox extends StatelessWidget {
  const FxCheckbox({
    required this.value,
    this.onChanged,
    super.key,
    this.size = 24.0,
    this.iconSize = 20.0,
    this.backgroundColor,
    this.iconColor,
    this.icon = Icons.check,
    this.borderColor,
    this.borderRadius = 4.0,
    this.isDisabled = false,
    this.semanticLabel,
    this.duration = const Duration(milliseconds: 200),
    this.curve = Curves.easeInOut,
    this.focusNode,
  });

  final bool value;
  final ValueChanged<bool>? onChanged;
  final double size;
  final double iconSize;
  final Color? backgroundColor;
  final Color? iconColor;
  final IconData icon;
  final Color? borderColor;
  final double borderRadius;
  final bool isDisabled;
  final String? semanticLabel;
  final Duration duration;
  final Curve curve;
  final FocusNode? focusNode;

  bool get _isInteractive => !isDisabled;

  @override
  Widget build(BuildContext context) {
    final effectiveBackgroundColor =
        backgroundColor ?? Theme.of(context).primaryColor;
    final effectiveBorderColor = borderColor ?? Theme.of(context).dividerColor;
    final effectiveIconColor =
        iconColor ?? Theme.of(context).iconTheme.color ?? Colors.white;

    return Semantics(
      label: semanticLabel ?? 'Checkbox',
      selected: value,
      child: Focus(
        focusNode: focusNode,
        child: InkWell(
          onTap: _isInteractive && onChanged != null
              ? () => onChanged!(!value)
              : null,
          borderRadius: BorderRadius.circular(borderRadius),
          child: AnimatedContainer(
            duration: duration,
            curve: curve,
            height: size,
            width: size,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              color: value ? effectiveBackgroundColor : Colors.transparent,
              border: Border.all(
                color: !value ? effectiveBorderColor : effectiveBackgroundColor,
                width: value ? 2 : 1,
              ),
            ),
            child: AnimatedSwitcher(
              duration: duration,
              child: value
                  ? Icon(
                      icon,
                      key: const ValueKey('checked'),
                      color: effectiveIconColor,
                      size: iconSize,
                    )
                  : SizedBox(
                      key: const ValueKey('unchecked'),
                      width: iconSize,
                      height: iconSize,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
