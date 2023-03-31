import 'package:flutter_test/flutter_test.dart';
import 'package:quickly/quickly.dart';

void main() {
  group('String Extensions', () {
    test('.regex("[a-zA-Z]+") - abc is a albhabet', () {
      const String source = '[a-zA-Z]+';
      const String string = 'abc';
      expect(string.regex(source), equals(true));
    });

    test('.regex(source) - abc is not albhabet', () {
      const String source = '[0-9]+';
      const String string = 'abc';
      expect(string.regex(source), equals(false));
    });

    test('.regex(source) - 123 is a number', () {
      const String source = '[0-9]+';
      const String string = '123';
      expect(string.regex(source), equals(true));
    });

    test('.isAlphabet - abc is a albhabet',
        () => expect('abc'.isAlphabet, equals(true)));

    test('.isAlphabet - str123ing is not albhabet',
        () => expect('str12ing'.isAlphabet, equals(false)));

    test('.isNumber - 123 is a number',
        () => expect('123'.isNumber, equals(true)));

    test('.isNumber - str12ing is not number',
        () => expect('str12ing'.isNumber, equals(false)));

    test('.isAlphaNumeric - str123ing is alphaNumeric',
        () => expect('str12ing'.isAlphaNumeric, equals(true)));
    test('.isEmail - abc@gmail.com is valid email return true',
        () => expect('abc@gmail.com'.isEmail, equals(true)));
    test('.isEmail - abcgmail.com is invalid email return false',
        () => expect('abcgmail.com'.isEmail, equals(false)));
    test('.isEmail - abc@gmail is invalid email return false',
        () => expect('abc@gmail'.isEmail, equals(false)));
    test('.minLen - length of abc is 3 return true',
        () => expect('abc'.minLen(3), equals(true)));
    test('.minLen - length of ab is less then 3 return false',
        () => expect('ab'.minLen(3), equals(false)));
    test('.mask - mask 12345 to **345',
        () => expect('12345'.mask(upto: 2), equals('**345')));
    test('.mask - mask 12345 to 123**',
        () => expect('12345'.mask(upto: 2, atEnd: true), equals('123**')));
  });
}
