import "package:flutter/material.dart";
import "package:quickly/quickly.dart";

/// A custom text form field widget with additional features.
class FxTextFormField extends StatefulWidget {
  /// Constructs a FxTextFormField.
  const FxTextFormField({
    super.key,
    this.hintText,
    this.label,
    this.fieldColor,
    this.borderColor,
    this.prefixIcon,
    this.suffixIcon,
    this.isSecure = false,
    this.borderRadius,
    this.maxLines,
    this.keyboardType,
    this.border = false,
    this.controller,
    this.validations,
    this.padding,
    this.boxShadow,
  });

  /// The label displayed above the text form field.
  final String? label;

  /// The hint text displayed inside the text form field when empty.
  final String? hintText;

  /// The background color of the text form field.
  final Color? fieldColor;

  /// The border color of the text form field.
  final Color? borderColor;

  /// The icon displayed as a prefix of the text form field.
  final IconData? prefixIcon;

  /// The icon displayed as a suffix of the text form field.
  final IconData? suffixIcon;

  /// Determines whether the text form field is secure (e.g., for passwords).
  final bool isSecure;

  /// The border radius of the text form field container.
  final BorderRadiusGeometry? borderRadius;

  /// The maximum number of lines for multi-line input.
  final int? maxLines;

  /// The type of keyboard to display for text input.
  final TextInputType? keyboardType;

  /// Determines whether to display a border around the text form field.
  final bool border;

  /// The controller for editing the text.
  final TextEditingController? controller;

  /// The list of validation rules to apply to the text form field.
  final List<String>? validations;

  /// The padding around the text form field container.
  final EdgeInsets? padding;

  final List<BoxShadow>? boxShadow;

  @override
  State<FxTextFormField> createState() => _FxTextFormFieldState();
}

class _FxTextFormFieldState extends State<FxTextFormField> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, String> _errors = <String, String>{};

  @override
  Widget build(BuildContext context) => Form(
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
              padding: widget.padding ?? FxPadding.px20,
              decoration: BoxDecoration(
                color: widget.fieldColor ?? FxColor.gray100,
                border: widget.border
                    ? Border.all(
                        color: widget.borderColor ?? FxColor.gray100,
                      )
                    : Border.all(style: BorderStyle.none),
                borderRadius: widget.borderRadius ?? FxRadius.all(10),
                boxShadow: widget.boxShadow,
              ),
              child: TextFormField(
                controller: widget.controller,
                decoration: InputDecoration(
                  suffixIconConstraints: const BoxConstraints(maxWidth: 30),
                  prefixIconConstraints: const BoxConstraints(maxWidth: 30),
                  suffixIcon:
                      Icon(widget.suffixIcon).hide(widget.suffixIcon == null),
                  prefixIcon:
                      Icon(widget.prefixIcon).hide(widget.prefixIcon == null),
                  hintText: widget.hintText ?? "",
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
                    return "This field is required.";
                  }
                  if (widget.validations != null) {
                    for (final String validation in widget.validations!) {
                      final ValidatorFunction? validate =
                          validators[validation];
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
