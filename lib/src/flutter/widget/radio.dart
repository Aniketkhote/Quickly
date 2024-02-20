import "package:flutter/material.dart";
import "package:quickly/quickly.dart";

/// A customizable radio button widget with additional features provided by FxRadio.
class FxRadio<T> extends StatefulWidget {
  /// Constructs an FxRadio.
  const FxRadio({
    required this.groupValue,
    required this.value,
    required this.onChanged,
    super.key,
    this.size,
    this.activeColor,
    this.borderColor,
  });

  /// The value of the currently selected radio button in the group.
  final T groupValue;

  /// The value represented by this radio button.
  final T value;

  /// Called when the user selects this radio button.
  final ValueChanged<T> onChanged;

  /// The size of the radio button.
  final double? size;

  /// The color used when the radio button is selected.
  final Color? activeColor;

  /// The color of the radio button border.
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
  Widget build(BuildContext context) => GestureDetector(
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
