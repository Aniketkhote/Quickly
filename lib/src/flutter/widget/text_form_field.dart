import 'package:flutter/material.dart';

import '../../../quickly.dart';

typedef ValidatorFunction = String? Function(String);

String? requiredValidator(String value) {
  return value.isEmpty ? 'This field is required.' : null;
}

String? emailValidator(String value) {
  return value.isEmail == false ? 'Please enter a valid email address.' : null;
}

String? minLengthValidator(String value, [int min = 6]) {
  return value.length < min
      ? 'The value must be at least $min characters.'
      : null;
}

String? maxLengthValidator(String value, [int max = 12]) {
  return value.length > max
      ? 'The value must be at most $max characters.'
      : null;
}

String? numericValidator(String value) {
  return value.isNumber == false ? 'Please enter a valid number.' : null;
}

String? alphabeticValidator(String value) {
  return value.isAlphabet == false ? 'Please enter only letters.' : null;
}

String? alphanumericValidator(String value) {
  return value.isAlphaNumeric == false
      ? 'Please enter only letters and numbers.'
      : null;
}

final Map<String, ValidatorFunction> validators = <String, ValidatorFunction>{
  'required': requiredValidator,
  'email': emailValidator,
  'minLength': minLengthValidator,
  'maxLength': maxLengthValidator,
  'numeric': numericValidator,
  'alphabetic': alphabeticValidator,
  'alphanumeric': alphanumericValidator,
};

class FxTextFormField extends StatelessWidget {
  const FxTextFormField({
    this.hintText,
    this.label,
    this.fieldColor,
    this.leadingIcon,
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
  final IconData? leadingIcon;
  final bool isSecure;
  final BorderRadiusGeometry? borderRadius;
  final int? maxLines;
  final TextInputType? keyboardType;
  final bool border;
  final TextEditingController? controller;
  final List<String>? validations;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label ?? '',
          style: const TextStyle(fontSize: 18, color: FxColor.kcText),
        ).pb8.hideIf(label == null),
        Container(
          padding: FxPadding.px20,
          decoration: BoxDecoration(
            color: fieldColor ?? FxColor.kcTextField,
            border: Border.all(
                color: FxColor.gray300,
                style: border ? BorderStyle.solid : BorderStyle.none),
            borderRadius: borderRadius ?? FxRadius.all(10),
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  controller: controller,
                  decoration: InputDecoration(
                    icon: Icon(leadingIcon).hideIf(leadingIcon == null),
                    hintText: hintText ?? '',
                    border: InputBorder.none,
                  ),
                  keyboardType: keyboardType,
                  obscureText: isSecure,
                  maxLines: maxLines ?? 1,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required.';
                    }
                    if (validations != null) {
                      for (final String validation in validations!) {
                        final ValidatorFunction? validate =
                            validators[validation];
                        if (validate != null) {
                          final String? error = validate(value);
                          if (error != null) {
                            return error;
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
        ),
      ],
    );
  }
}
