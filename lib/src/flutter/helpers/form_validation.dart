import 'package:quickly/quickly.dart';

/// A function that performs validation on a given input value.
typedef ValidatorFunction = String? Function(String);
typedef MatchValidatorFunction = String? Function(String, String);
typedef RangeValidatorFunction = String? Function(String,
    {required double min, required double max});

/// Validates whether the input value is empty or not.
String? requiredValidator(String value) =>
    value.isEmpty ? 'This field is required.' : null;

/// Validates whether the input value is a valid email address.
String? emailValidator(String value) {
  if (value.isEmpty || !value.isEmail) {
    return 'Please enter a valid email address.';
  }
  return null;
}

/// Validates the length of the input value based on minimum and maximum constraints.
String? lengthValidator(String value, {int? min, int? max}) {
  if (min != null && value.length < min) {
    return 'The value must be at least $min characters.';
  }
  if (max != null && value.length > max) {
    return 'The value must be at most $max characters.';
  }
  return null;
}

/// Validates whether the input value is a valid number.
String? numericValidator(String value) {
  if (value.isEmpty || double.tryParse(value) == null) {
    return 'Please enter a valid number.';
  }
  return null;
}

/// Validates whether the input value contains only alphabetic characters.
String? alphabeticValidator(String value) {
  if (value.isEmpty || !value.isAlphabet) {
    return 'Please enter only letters.';
  }
  return null;
}

/// Validates whether the input value contains only alphanumeric characters.
String? alphanumericValidator(String value) {
  if (value.isEmpty || !value.isAlphaNumeric) {
    return 'Please enter only letters and numbers.';
  }
  return null;
}

/// Validates whether the input value is a valid date in the format yyyy-mm-dd.
String? dateValidator(String value) {
  try {
    final date = DateTime.parse(value);
    if (date.toString() == value) {
      return null;
    }
  } catch (e) {
    return 'Please enter a valid date (yyyy-mm-dd).';
  }
  return 'Please enter a valid date (yyyy-mm-dd).';
}

/// Validates the strength of a password.
String? passwordStrengthValidator(String value) {
  if (value.length < 8) {
    return 'Password must be at least 8 characters long.';
  }
  if (!RegExp(r'[A-Z]').hasMatch(value)) {
    return 'Password must contain at least one uppercase letter.';
  }
  if (!RegExp(r'[a-z]').hasMatch(value)) {
    return 'Password must contain at least one lowercase letter.';
  }
  if (!RegExp(r'[0-9]').hasMatch(value)) {
    return 'Password must contain at least one digit.';
  }
  if (!RegExp(r'[!@#\$&*~]').hasMatch(value)) {
    return 'Password must contain at least one special character.';
  }
  return null;
}

/// Validates if the input value matches another value.
String? matchValidator(String value, String matchValue) {
  if (value != matchValue) {
    return 'The values do not match.';
  }
  return null;
}

/// Validates if the input value is within a specified numeric range.
String? rangeValidator(String value,
    {required double min, required double max}) {
  final numValue = double.tryParse(value);
  if (numValue == null || numValue < min || numValue > max) {
    return 'Value must be between $min and $max.';
  }
  return null;
}

/// A map containing pre-defined validator functions.
final Map<String, ValidatorFunction> validators = <String, ValidatorFunction>{
  'required': requiredValidator,
  'email': emailValidator,
  'length': lengthValidator,
  'numeric': numericValidator,
  'alphabetic': alphabeticValidator,
  'alphanumeric': alphanumericValidator,
  'date': dateValidator,
  'password': passwordStrengthValidator,
};

/// A map containing match validator functions.
final Map<String, MatchValidatorFunction> matchValidators =
    <String, MatchValidatorFunction>{
  'match': matchValidator,
};

/// A map containing range validator functions.
final Map<String, RangeValidatorFunction> rangeValidators =
    <String, RangeValidatorFunction>{
  'range': rangeValidator,
};
