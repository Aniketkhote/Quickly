import '../../../quickly.dart';

typedef ValidatorFunction = String? Function(String);

String? requiredValidator(String value) {
  return value.isEmpty ? 'This field is required.' : null;
}

String? emailValidator(String value) {
  if (value.isEmpty || !value.isEmail) {
    return 'Please enter a valid email address.';
  }
  return null;
}

String? lengthValidator(String value, {int? min, int? max}) {
  if (min != null && value.length < min) {
    return 'The value must be at least $min characters.';
  }
  if (max != null && value.length > max) {
    return 'The value must be at most $max characters.';
  }
  return null;
}

String? numericValidator(String value) {
  if (value.isEmpty || double.tryParse(value) == null) {
    return 'Please enter a valid number.';
  }
  return null;
}

String? alphabeticValidator(String value) {
  if (value.isEmpty || !value.isAlphabet) {
    return 'Please enter only letters.';
  }
  return null;
}

String? alphanumericValidator(String value) {
  if (value.isEmpty || !value.isAlphaNumeric) {
    return 'Please enter only letters and numbers.';
  }
  return null;
}

final Map<String, ValidatorFunction> validators = <String, ValidatorFunction>{
  'required': requiredValidator,
  'email': emailValidator,
  'length': lengthValidator,
  'numeric': numericValidator,
  'alphabetic': alphabeticValidator,
  'alphanumeric': alphanumericValidator,
};
