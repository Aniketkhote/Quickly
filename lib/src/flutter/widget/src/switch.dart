import 'package:flutter/material.dart';
import 'package:quickly/quickly.dart';

/// A customizable switch widget with additional features provided by FxSwitch.
class FxSwitch extends StatefulWidget {
  /// Constructs an FxSwitch.
  const FxSwitch({
    required this.value,
    required this.onChanged,
    super.key,
    this.size,
    this.activeColor,
    this.inactiveColor,
  });

  /// The current state of the switch.
  final bool value;

  /// Called when the user toggles the switch on or off.
  final Function(bool value) onChanged;

  /// The size of the switch.
  final double? size;

  /// The color used when the switch is in the "on" position.
  final Color? activeColor;

  /// The color used when the switch is in the "off" position.
  final Color? inactiveColor;

  @override
  State<FxSwitch> createState() => _FxSwitchState();
}

class _FxSwitchState extends State<FxSwitch> {
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    isChecked = widget.value;
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          setState(() {
            isChecked = !isChecked;
            widget.onChanged(isChecked);
          });
        },
        child: AnimatedContainer(
          height: widget.size ?? 24.0,
          width: widget.size ?? 45.0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.fastLinearToSlowEaseIn,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: isChecked
                ? widget.activeColor ??
                    FxColor.primary // Change active color as needed
                : widget.inactiveColor ??
                    Colors.grey, // Change inactive color as needed
          ),
          child: Stack(
            alignment: isChecked ? Alignment.centerRight : Alignment.centerLeft,
            children: <Widget>[
              Container(
                width: widget.size ?? 24.0,
                height: widget.size ?? 24.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      );
}
