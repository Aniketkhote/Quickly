/// A function that performs validation on a given input value.
typedef ValidatorFunction = String? Function(String);
typedef MatchValidatorFunction = String? Function(String, String);
typedef RangeValidatorFunction = String? Function(String,
    {required double min, required double max});

/// Validates whether the input value is empty or not.
String? requiredValidator(String value) =>
    value.trim().isEmpty ? 'This field is required.' : null;

/// Validates whether the input value is a valid email address.
String? emailValidator(String value) {
  final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  return !emailRegExp.hasMatch(value.trim())
      ? 'Please enter a valid email address.'
      : null;
}

/// Validates the length of the input value based on minimum and maximum constraints.
String? lengthValidator(String value, {int? min, int? max}) {
  final length = value.trim().length;
  if (min != null && length < min) {
    return 'The value must be at least $min characters.';
  }
  if (max != null && length > max) {
    return 'The value must be at most $max characters.';
  }
  return null;
}

/// Validates whether the input value is a valid number.
String? numericValidator(String value) => double.tryParse(value.trim()) == null
    ? 'Please enter a valid number.'
    : null;

/// Validates whether the input value contains only alphabetic characters.
String? alphabeticValidator(String value) =>
    !RegExp(r'^[a-zA-Z]+$').hasMatch(value.trim())
        ? 'Please enter only letters.'
        : null;

/// Validates whether the input value contains only alphanumeric characters.
String? alphanumericValidator(String value) =>
    !RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value.trim())
        ? 'Please enter only letters and numbers.'
        : null;

/// Validates whether the input value is a valid date in the format yyyy-mm-dd.
String? dateValidator(String value) {
  try {
    DateTime.parse(value.trim());
    return null;
  } catch (_) {
    return 'Please enter a valid date (yyyy-mm-dd).';
  }
}

/// Validates the strength of a password.
String? passwordStrengthValidator(String value) {
  final password = value.trim();
  if (password.length < 8)
    return 'Password must be at least 8 characters long.';
  if (!password.contains(RegExp(r'[A-Z]')))
    return 'Password must contain at least one uppercase letter.';
  if (!password.contains(RegExp(r'[a-z]')))
    return 'Password must contain at least one lowercase letter.';
  if (!password.contains(RegExp(r'[0-9]')))
    return 'Password must contain at least one digit.';
  if (!password.contains(RegExp(r'[!@#\$&*~]')))
    return 'Password must contain at least one special character.';
  return null;
}

/// Validates if the input value matches another value.
String? matchValidator(String value, String matchValue) =>
    value.trim() != matchValue.trim() ? 'The values do not match.' : null;

/// Validates if the input value is within a specified numeric range.
String? rangeValidator(String value,
    {required double min, required double max}) {
  final numValue = double.tryParse(value.trim());
  return (numValue == null || numValue < min || numValue > max)
      ? 'Value must be between $min and $max.'
      : null;
}

/// A map containing pre-defined validator functions.
final Map<String, ValidatorFunction> validators = {
  'required': requiredValidator,
  'email': emailValidator,
  'numeric': numericValidator,
  'alphabetic': alphabeticValidator,
  'alphanumeric': alphanumericValidator,
  'date': dateValidator,
  'password': passwordStrengthValidator,
};

/// A map containing match validator functions.
final Map<String, MatchValidatorFunction> matchValidators = {
  'match': matchValidator,
};

/// A map containing range validator functions.
final Map<String, RangeValidatorFunction> rangeValidators = {
  'range': rangeValidator,
};
