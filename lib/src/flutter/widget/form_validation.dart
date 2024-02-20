import '../../../quickly.dart';

/// A function that performs validation on a given input value.
typedef ValidatorFunction = String? Function(String);

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

/// A map containing pre-defined validator functions.
final Map<String, ValidatorFunction> validators = <String, ValidatorFunction>{
  'required': requiredValidator,
  'email': emailValidator,
  'length': lengthValidator,
  'numeric': numericValidator,
  'alphabetic': alphabeticValidator,
  'alphanumeric': alphanumericValidator,
};
