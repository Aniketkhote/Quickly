import "package:flutter/material.dart";

import "../../../../quickly.dart";

class FxTextFormField extends StatefulWidget {
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

  final String? label;
  final String? hintText;
  final Color? fieldColor;
  final Color? borderColor;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool isSecure;
  final BorderRadiusGeometry? borderRadius;
  final int? maxLines;
  final TextInputType? keyboardType;
  final bool border;
  final TextEditingController? controller;
  final List<String>? validations;
  final EdgeInsets? padding;
  final List<BoxShadow>? boxShadow;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;
  final bool enabled;
  final TextInputAction? textInputAction;
  final TextStyle? style;
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
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
            ),
          ),
        Container(
          decoration: BoxDecoration(
            color: widget.fieldColor ?? Colors.grey[100],
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
              hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey[600],
                  ),
              border: InputBorder.none,
            ),
            keyboardType: widget.keyboardType,
            obscureText: _obscureText,
            maxLines: widget.isSecure ? 1 : widget.maxLines,
            enabled: widget.enabled,
            style: widget.style ?? Theme.of(context).textTheme.bodyLarge,
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
                  // Assuming you have a list of validation functions
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
