import 'package:flutter/material.dart';

import '../../../quickly.dart';

class FxCheckbox extends StatefulWidget {
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

  final double? size;
  final double? iconSize;
  final Function(bool value) onChange;
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? borderColor;
  final IconData? icon;
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
  Widget build(BuildContext context) {
    return GestureDetector(
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
          borderRadius: BorderRadius.circular(2.0),
          color: isChecked
              ? widget.backgroundColor ?? FxColor.primary
              : Colors.transparent,
          border: Border.all(
            color:
                widget.borderColor ?? widget.backgroundColor ?? FxColor.primary,
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
}
