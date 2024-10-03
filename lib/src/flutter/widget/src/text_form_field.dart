import "package:flutter/material.dart";
import "package:quickly/quickly.dart";

/// A custom text form field widget with additional features and improved functionality.
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
    this.onChanged,
    this.focusNode,
    this.enabled = true,
    this.textInputAction,
    this.style,
    this.textCapitalization = TextCapitalization.none,
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

  /// The box shadow for the text form field container.
  final List<BoxShadow>? boxShadow;

  /// Called when the text changes.
  final ValueChanged<String>? onChanged;

  /// Defines the keyboard focus for this widget.
  final FocusNode? focusNode;

  /// Whether the form field is enabled.
  final bool enabled;

  /// The type of action button to use for the keyboard.
  final TextInputAction? textInputAction;

  /// The style to use for the text being edited.
  final TextStyle? style;

  /// Configures how the platform keyboard will select an uppercase or lowercase keyboard.
  final TextCapitalization textCapitalization;

  @override
  State<FxTextFormField> createState() => _FxTextFormFieldState();
}

class _FxTextFormFieldState extends State<FxTextFormField> {
  final GlobalKey<FormFieldState<String>> _fieldKey =
      GlobalKey<FormFieldState<String>>();
  late final TextEditingController _controller;
  bool _obscureText = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _obscureText = widget.isSecure;
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (widget.label != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              widget.label!,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: FxColor.kcText),
            ),
          ),
        Container(
          decoration: BoxDecoration(
            color: widget.fieldColor ?? FxColor.gray100,
            border: widget.border
                ? Border.all(color: widget.borderColor ?? FxColor.gray300)
                : null,
            borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
            boxShadow: widget.boxShadow,
          ),
          child: TextFormField(
            key: _fieldKey,
            controller: _controller,
            focusNode: widget.focusNode,
            decoration: InputDecoration(
              contentPadding: widget.padding ??
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              suffixIcon: widget.isSecure
                  ? IconButton(
                      icon: Icon(_obscureText
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () =>
                          setState(() => _obscureText = !_obscureText),
                    )
                  : (widget.suffixIcon != null
                      ? Icon(widget.suffixIcon)
                      : null),
              prefixIcon:
                  widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
              hintText: widget.hintText,
              border: InputBorder.none,
            ),
            keyboardType: widget.keyboardType,
            obscureText: _obscureText,
            maxLines: widget.isSecure ? 1 : widget.maxLines,
            enabled: widget.enabled,
            style: widget.style,
            textInputAction: widget.textInputAction,
            textCapitalization: widget.textCapitalization,
            onChanged: (value) {
              widget.onChanged?.call(value);
              _fieldKey.currentState?.validate();
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "This field is required.";
              }
              if (widget.validations != null) {
                for (final validation in widget.validations!) {
                  final validate = validators[validation];
                  if (validate != null) {
                    final result = validate(value);
                    if (result != null) {
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
    );
  }
}
