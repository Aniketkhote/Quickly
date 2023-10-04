import 'package:flutter/material.dart';

import '../../../quickly.dart';
import 'form_validation.dart';

class FxTextFormField extends StatefulWidget {
  const FxTextFormField({
    this.hintText,
    this.label,
    this.fieldColor,
    this.prefixIcon,
    this.suffixIcon,
    this.isSecure = false,
    this.borderRadius,
    this.maxLines,
    this.keyboardType,
    this.border = false,
    this.controller,
    this.validations,
    Key? key,
  }) : super(key: key);

  final String? label;
  final String? hintText;
  final Color? fieldColor;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool isSecure;
  final BorderRadiusGeometry? borderRadius;
  final int? maxLines;
  final TextInputType? keyboardType;
  final bool border;
  final TextEditingController? controller;
  final List<String>? validations;

  @override
  State<FxTextFormField> createState() => _FxTextFormFieldState();
}

class _FxTextFormFieldState extends State<FxTextFormField> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, String> _errors = <String, String>{};

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (widget.label != null)
            Text(
              widget.label!,
              style: const TextStyle(fontSize: 18, color: FxColor.kcText),
            ).pb8,
          Container(
            padding: FxPadding.px20,
            decoration: BoxDecoration(
              color: widget.fieldColor ?? FxColor.light.withOpacity(.03),
              border: widget.border
                  ? Border.all(color: Colors.grey.withOpacity(0.3))
                  : Border.all(style: BorderStyle.none),
              borderRadius: widget.borderRadius ?? FxRadius.all(10),
            ),
            child: TextFormField(
              controller: widget.controller,
              decoration: InputDecoration(
                suffixIcon:
                    Icon(widget.suffixIcon).hide(widget.suffixIcon == null),
                prefixIcon:
                    Icon(widget.prefixIcon).hide(widget.prefixIcon == null),
                hintText: widget.hintText ?? '',
                border: InputBorder.none,
              ),
              keyboardType: widget.keyboardType,
              obscureText: widget.isSecure,
              maxLines: widget.maxLines ?? 1,
              onChanged: (_) {
                // Clear error message when input changes
                _errors.clear();
                _formKey.currentState?.validate();
              },
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'This field is required.';
                }
                if (widget.validations != null) {
                  for (final String validation in widget.validations!) {
                    final ValidatorFunction? validate = validators[validation];
                    if (validate != null) {
                      final String? error = _errors[value];
                      if (error != null) {
                        return error;
                      }
                      final String? result = validate(value);
                      if (result != null) {
                        _errors[value] = result;
                        return result;
                      }
                    }
                  }
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}
