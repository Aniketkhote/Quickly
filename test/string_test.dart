import "package:flutter_test/flutter_test.dart";
import "package:quickly/quickly.dart";

void main() {
  group("String Extensions", () {
    test("regex() should return true if string matches pattern", () {
      expect("abc123".regex(r"^[a-zA-Z0-9]+$"), true);
      expect("".regex(r"^[a-zA-Z0-9]+$"), false);
      expect("abcd".regex(r"^[a-zA-Z]+$"), true);
      expect("1234".regex(r"^[0-9]+$"), true);
      expect("a12".regex(r"^[a-zA-Z0-9]+$"), true);
    });

    test("isAlphabet should return true if string contains only letters", () {
      expect("abcd".isAlphabet, true);
      expect("123".isAlphabet, false);
      expect("abc123".isAlphabet, false);
      expect("".isAlphabet, false);
    });

    test("isNumber should return true if string contains only digits", () {
      expect("1234".isNumber, true);
      expect("abc".isNumber, false);
      expect("123abc".isNumber, false);
      expect("".isNumber, false);
    });

    test(
        "isAlphaNumeric should return true if string contains only letters and digits",
        () {
      expect("abc123".isAlphaNumeric, true);
      expect("abc".isAlphaNumeric, true);
      expect("123".isAlphaNumeric, true);
      expect("!@#".isAlphaNumeric, false);
      expect("".isAlphaNumeric, false);
    });

    group("EmailValidator", () {
      test("Valid email addresses", () {
        expect("john.doe@example.com".isEmail, isTrue);
        expect("jane@example.co.uk".isEmail, isTrue);
        expect("user+label@example.com".isEmail, isTrue);
        expect("user.label-01@example.com".isEmail, isTrue);
        expect("user123@example.com".isEmail, isTrue);
      });

      test("Invalid email addresses", () {
        expect("".isEmail, isFalse);
        expect("@example.com".isEmail, isFalse);
        expect("user@.example.com".isEmail, isFalse);
        expect("user@example.".isEmail, isFalse);
        expect("user@.example.".isEmail, isFalse);
        expect("user name@example.com".isEmail, isFalse);
        expect("user@name@.example.com".isEmail, isFalse);
        expect("user@name@example.com@".isEmail, isFalse);
      });
    });

    test("minLen() should return true if string is at least n characters long",
        () {
      expect("1234".minLen(4), true);
      expect("12".minLen(3), false);
      expect("".minLen(1), false);
    });

    test("maxLen() should return true if string is at most n characters long",
        () {
      expect("1234".maxLen(4), true);
      expect("12345".maxLen(4), false);
      expect("".maxLen(1), true);
    });

    test("inRange() should return true if string length is between n and m",
        () {
      expect("1234".inRange(3, 5), true);
      expect("123".inRange(4, 6), false);
      expect("12".inRange(1, 3), true);
      expect("".inRange(1, 2), false);
    });

    test("removeFirst() should remove the first n characters of the string",
        () {
      expect("12345".removeFirst(3), "45");
      expect("123".removeFirst(), "23");
      expect("1".removeFirst(), "");
      expect("".removeFirst(), "");
    });

    test("removeLast() should remove the last n characters of the string", () {
      expect("12345".removeLast(3), "12");
      expect("123".removeLast(), "12");
      expect("1".removeLast(), "");
      expect("".removeLast(), "");
    });

    test("removeWhitespace should remove all whitespace from a string", () {
      expect("Hello world".removeWhitespace, "Helloworld");
      expect(" Foo bar ".removeWhitespace, "Foobar");
    });

    test("concat should concatenate two strings", () {
      expect("Hello".concat("world"), "Hello world");
      expect("Foo".concat("Bar"), "Foo Bar");
      expect("".concat("hello"), " hello");
    });

    test("append should append a string to another string", () {
      expect("Hello".append(" world"), "Hello world");
      expect("Foo".append("Bar"), "FooBar");
      expect("".append("hello"), "hello");
    });

    test("prepend should prepend a string to another string", () {
      expect("world".prepend("Hello "), "Hello world");
      expect("Bar".prepend("Foo"), "FooBar");
      expect("hello".prepend(""), "hello");
    });

    test("mask should mask a portion of a string", () {
      expect("1234567890".mask(upto: 5), "*****67890");
      expect("1234567890".mask(upto: 3, mask: "+"), "+++4567890");
      expect("1234567890".mask(upto: 0), "1234567890");
    });

    test("occurrences should return a map of all character occurrences", () {
      expect(
        "Hello".occurrences,
        <String, int>{"H": 1, "e": 1, "l": 2, "o": 1},
      );
      expect(
        "Mississippi".occurrences,
        <String, int>{"M": 1, "i": 4, "s": 4, "p": 2},
      );
    });

    test(
        "countOccurrence should return the number of times a substring appears in a string",
        () {
      expect("Hello world".countOccurrence("l"), 3);
      expect("Mississippi".countOccurrence("ss"), 2);
    });

    test("ifEmpty should return the given value if the string is empty", () {
      expect("Hello".ifEmpty("world"), "Hello");
      expect("".ifEmpty("world"), "world");
      expect(" ".ifEmpty("world"), "world");
    });

    test("toInt should return the integer value of a string", () {
      expect("123".toInt, 123);
      expect("-456".toInt, -456);
      expect("3.14".toInt, 3);
    });

    test("toDouble should return the double value of a string", () {
      expect("123.45".toDouble, 123.45);
      expect("-3.14".toDouble, -3.14);
      expect("Hello".toDouble, null);
    });

    test("toSlug should return a slugified version of the string", () {
      expect("This is a test".toSlug, "this-is-a-test");
      expect("UPPERCASE".toSlug, "uppercase");
    });

    test("toCapitalCase should return the string in capital case", () {
      expect("this is a test".toCapitalCase, "This Is A Test");
      expect("a b c".toCapitalCase, "A B C");
      expect("UPPERCASE".toCapitalCase, "Uppercase");
    });

    test("toTitleCase should return the string in title case", () {
      expect("this is a test".toTitleCase, "This Is A Test");
      expect("a b c".toTitleCase, "A B C");
      expect("UPPERCASE".toTitleCase, "Uppercase");
    });

    test("toSentenceCase should return the string in sentence case", () {
      expect("this is a test.".toSentenceCase, "This is a test.");
      expect("a b c.".toSentenceCase, "A b c.");
      expect("UPPERCASE.".toSentenceCase, "Uppercase.");
    });

    test(
        "isSentence should correctly identify if the string ends with a sentence-ending punctuation",
        () {
      expect("This is a sentence.".isSentence, true);
      expect("Ends with a !".isSentence, true);
      expect("no punctuation".isSentence, false);
    });

    test("isTitle should correctly identify if the string is in title case",
        () {
      expect("This Is A Title".isTitle, true);
      expect("This is not a title".isTitle, false);
      expect("no Capitals".isTitle, false);
    });

    test("isCapital should correctly identify if the string is in capital case",
        () {
      expect("THIS IS IN CAPITALS".isCapital, false);
      expect("This is not in capitals".isCapital, false);
      expect("NOCAPS".isCapital, false);
    });

    test("isLower should correctly identify if the string is all lowercase",
        () {
      expect("this is all lowercase".isLower, true);
      expect("This is not all lowercase".isLower, false);
      expect("ALLCAPS".isLower, false);
    });

    test("isUpper should correctly identify if the string is all uppercase",
        () {
      expect("THIS IS ALL UPPERCASE".isUpper, true);
      expect("This is not all uppercase".isUpper, false);
      expect("nouppercase".isUpper, false);
    });

    test(
        "isSvg should correctly identify if the string is a path to an SVG file",
        () {
      expect("file.svg".isSvg, true);
      expect("file.SVG".isSvg, true);
      expect("notsvg.txt".isSvg, false);
      expect("/path/to/file.svg".isSvg, true);
      expect("/path/to/file.txt".isSvg, false);
    });
    test(
        "isVideo should correctly identify if the string is a path to an Video file",
        () {
      expect("file.mp4".isVideo, true);
      expect("file.avi".isVideo, true);
      expect("notsvg.mpeg".isVideo, false);
      expect("/path/to/file.mkv".isVideo, true);
      expect("/path/to/file.mp3".isVideo, false);
    });
  });
}
