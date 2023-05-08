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
