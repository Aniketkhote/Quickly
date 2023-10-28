import 'package:flutter/material.dart';

import '../../../quickly.dart';

class FxSwitch extends StatefulWidget {
  const FxSwitch({
    required this.value,
    required this.onChanged,
    super.key,
    this.size,
    this.activeColor,
    this.inactiveColor,
  });
  final bool value;
  final Function(bool value) onChanged;
  final double? size;
  final Color? activeColor;
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
  Widget build(BuildContext context) {
    return GestureDetector(
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
          borderRadius: BorderRadius.circular(24.0),
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
}
