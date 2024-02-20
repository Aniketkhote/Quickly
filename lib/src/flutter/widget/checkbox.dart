import 'package:flutter/material.dart';

import '../../../quickly.dart';

/// A checkbox widget with customizable appearance and behavior.
class FxCheckbox extends StatefulWidget {
  /// Constructs a FxCheckbox.
  const FxCheckbox({
    required this.onChange,
    required this.isChecked,
    super.key,
    this.size,
    this.iconSize,
    this.backgroundColor,
    this.iconColor,
    this.icon,
    this.borderColor,
  });

  /// The size of the checkbox.
  final double? size;

  /// The size of the checkbox icon.
  final double? iconSize;

  /// Callback function called when the checkbox state changes.
  final Function(bool value) onChange;

  /// The background color of the checkbox.
  final Color? backgroundColor;

  /// The color of the checkbox icon.
  final Color? iconColor;

  /// The icon displayed when the checkbox is checked.
  final IconData? icon;

  /// The color of the checkbox border.
  final Color? borderColor;

  /// Indicates whether the checkbox is checked or not.
  final bool isChecked;

  @override
  State<FxCheckbox> createState() => _FxCheckboxState();
}

class _FxCheckboxState extends State<FxCheckbox> {
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    isChecked = widget.isChecked;
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          setState(() {
            isChecked = !isChecked;
            widget.onChange(isChecked);
          });
        },
        child: AnimatedContainer(
          height: widget.size ?? 24,
          width: widget.size ?? 24,
          duration: const Duration(milliseconds: 500),
          curve: Curves.fastLinearToSlowEaseIn,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: isChecked
                ? widget.backgroundColor ?? FxColor.primary
                : Colors.transparent,
            border: Border.all(
              color: widget.borderColor ??
                  widget.backgroundColor ??
                  FxColor.primary,
            ),
          ),
          child: isChecked
              ? Icon(
                  widget.icon ?? Icons.check,
                  color: widget.iconColor ?? Colors.white,
                  size: widget.iconSize ?? 20,
                )
              : null,
        ),
      );
}
