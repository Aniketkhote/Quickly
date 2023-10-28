import 'package:flutter/material.dart';

import '../../../quickly.dart';

class FxRadio<T> extends StatefulWidget {
  const FxRadio({
    required this.groupValue,
    required this.value,
    required this.onChanged,
    super.key,
    this.size,
    this.activeColor,
    this.borderColor,
  });
  final T groupValue;
  final T value;
  final ValueChanged<T> onChanged;
  final double? size;
  final Color? activeColor;
  final Color? borderColor;

  @override
  State<FxRadio<T>> createState() => _FxRadioState<T>();
}

class _FxRadioState<T> extends State<FxRadio<T>> {
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    isChecked = widget.groupValue == widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = true;
          widget.onChanged(widget.value);
        });
      },
      child: Container(
        width: widget.size ?? 24.0,
        height: widget.size ?? 24.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isChecked
                ? widget.activeColor ?? FxColor.primary
                : widget.borderColor ?? Colors.grey,
          ),
          color: isChecked ? widget.activeColor : Colors.transparent,
        ),
        child: isChecked
            ? Center(
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: widget.size != null ? widget.size! / 2 : 12.0,
                ),
              )
            : null,
      ),
    );
  }
}
