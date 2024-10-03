import 'package:flutter/material.dart';

/// Extension on [Text] widget to provide convenient styling methods
extension TextExtension on Text {
  /// Applies a [TextStyle] to the existing text style
  ///
  /// This method allows you to modify various text properties in a single call
  ///
  /// Example:
  /// ```dart
  /// Text('Hello').style(fontSize: 20, color: Colors.red)
  /// ```
  Text style({
    Key? key,
    TextStyle? style,
    StrutStyle? strutStyle,
    bool? softWrap,
    TextOverflow? overflow,
    TextDirection? textDirection,
    Locale? locale,
    String? semanticsLabel,
    TextScaler? textScaler,
    TextWidthBasis? textWidthBasis,
    int? maxLines,
    TextAlign? textAlign,
  }) =>
      _copyWith(
        key: key,
        style: style,
        strutStyle: strutStyle,
        softWrap: softWrap,
        overflow: overflow,
        textDirection: textDirection,
        locale: locale,
        semanticsLabel: semanticsLabel,
        textScaler: textScaler,
        textWidthBasis: textWidthBasis,
        maxLines: maxLines,
        textAlign: textAlign,
      );

  /// Sets the font size of the text
  ///
  /// Example:
  /// ```dart
  /// Text('Hello').fontSize(20)
  /// ```
  Text fontSize(double fontSize) =>
      _copyWith(style: TextStyle(fontSize: fontSize));

  /// Applies h1 style: font size 96 logical pixels and light font weight
  Text get h1 => _copyWith(
      style: const TextStyle(fontSize: 96.0, fontWeight: FontWeight.w300));

  /// Applies h2 style: font size 60 logical pixels and light font weight
  Text get h2 => _copyWith(
      style: const TextStyle(fontSize: 60.0, fontWeight: FontWeight.w300));

  /// Applies h3 style: font size 48 logical pixels and regular font weight
  Text get h3 => _copyWith(style: const TextStyle(fontSize: 48.0));

  /// Applies h4 style: font size 34 logical pixels and regular font weight
  Text get h4 => _copyWith(style: const TextStyle(fontSize: 34.0));

  /// Applies h5 style: font size 24 logical pixels and regular font weight
  Text get h5 => _copyWith(style: const TextStyle(fontSize: 24.0));

  /// Applies h6 style: font size 20 logical pixels and medium font weight
  Text get h6 => _copyWith(
      style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500));

  /// Applies body1 style: font size 16 logical pixels and light font weight
  Text get body1 => _copyWith(style: const TextStyle(fontSize: 16.0));

  /// Applies body2 style: font size 14 logical pixels and medium font weight
  Text get body2 => _copyWith(
      style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500));

  /// Applies caption1 style: font size 12 logical pixels and light font weight
  Text get caption1 => _copyWith(style: const TextStyle(fontSize: 12.0));

  /// Applies caption2 style: font size 10 logical pixels and light font weight
  Text get caption2 => _copyWith(style: const TextStyle(fontSize: 10.0));

  /// Sets custom line height
  ///
  /// Example:
  /// ```dart
  /// Text('Hello').lineHeight(1.5)
  /// ```
  Text lineHeight(double height) => _copyWith(style: TextStyle(height: height));

  /// Sets text color
  ///
  /// Example:
  /// ```dart
  /// Text('Hello').color(Colors.red)
  /// ```
  Text color(Color color) => _copyWith(style: TextStyle(color: color));

  /// Sets text background color
  ///
  /// Example:
  /// ```dart
  /// Text('Hello').bgColor(Colors.yellow)
  /// ```
  Text bgColor(Color backgroundColor) =>
      _copyWith(style: TextStyle(backgroundColor: backgroundColor));

  /// Aligns the text to the left edge of the container
  Text get textLeft => _copyWith(textAlign: TextAlign.left);

  /// Aligns the text to the right edge of the container
  Text get textRight => _copyWith(textAlign: TextAlign.right);

  /// Aligns the text in the center of the container
  Text get textCenter => _copyWith(textAlign: TextAlign.center);

  /// Justifies the text
  Text get textJustify => _copyWith(textAlign: TextAlign.justify);

  /// Aligns the text to the start edge of the container (depends on text direction)
  Text get textStart => _copyWith(textAlign: TextAlign.start);

  /// Aligns the text to the end edge of the container (depends on text direction)
  Text get textEnd => _copyWith(textAlign: TextAlign.end);

  /// Sets the text direction to right-to-left
  Text get rtl => _copyWith(textDirection: TextDirection.rtl);

  /// Controls whether the text should break at soft line breaks
  ///
  /// Example:
  /// ```dart
  /// Text('Hello World').softWrap(false)
  /// ```
  Text softWrap(bool softWrap) => _copyWith(softWrap: softWrap);

  /// Sets overflow behavior to visible (text can overflow its bounds)
  Text get visible => _copyWith(overflow: TextOverflow.visible);

  /// Sets overflow behavior to clip (overflowing text is clipped)
  Text get clip => _copyWith(overflow: TextOverflow.clip);

  /// Sets overflow behavior to fade (overflowing text fades out)
  Text get fade => _copyWith(overflow: TextOverflow.fade);

  /// Sets overflow behavior to ellipsis (overflowing text is replaced with an ellipsis)
  Text get ellipsis => _copyWith(overflow: TextOverflow.ellipsis);

  /// Adds an underline to the text
  Text get underline =>
      _copyWith(style: const TextStyle(decoration: TextDecoration.underline));

  /// Sets the font family for the text
  ///
  /// Example:
  /// ```dart
  /// Text('Hello').fontFamily('Roboto')
  /// ```
  Text fontFamily(String fontFamily) =>
      _copyWith(style: TextStyle(fontFamily: fontFamily));

  /// Sets the text scale factor
  ///
  /// Example:
  /// ```dart
  /// Text('Hello').textScale(TextScaler.linear(1.5))
  /// ```
  Text textScale(TextScaler textScaler) => _copyWith(textScaler: textScaler);

  /// Sets text scale to extra small (0.75)
  Text get xs => _copyWith(textScaler: const TextScaler.linear(.75));

  /// Sets text scale to small (0.875)
  Text get sm => _copyWith(textScaler: const TextScaler.linear(0.875));

  /// Sets text scale to medium (1.0, default)
  Text get md => _copyWith(textScaler: TextScaler.noScaling);

  /// Sets text scale to large (1.125)
  Text get lg => _copyWith(textScaler: const TextScaler.linear(1.125));

  /// Sets text scale to extra large (1.25)
  Text get xl => _copyWith(textScaler: const TextScaler.linear(1.25));

  /// Sets text scale to 2x extra large (1.5)
  Text get xl2 => _copyWith(textScaler: const TextScaler.linear(1.5));

  /// Sets text scale to 3x extra large (1.875)
  Text get xl3 => _copyWith(textScaler: const TextScaler.linear(1.875));

  /// Sets text scale to 4x extra large (2.25)
  Text get xl4 => _copyWith(textScaler: const TextScaler.linear(2.25));

  /// Sets text scale to 5x extra large (3.0)
  Text get xl5 => _copyWith(textScaler: const TextScaler.linear(3.0));

  /// Sets text scale to 6x extra large (4.0)
  Text get xl6 => _copyWith(textScaler: const TextScaler.linear(4.0));

  /// Sets letter spacing
  ///
  /// Example:
  /// ```dart
  /// Text('Hello').letterSpacing(1.5)
  /// ```
  Text letterSpacing(double spacing) =>
      _copyWith(style: TextStyle(letterSpacing: spacing));

  /// Sets word spacing
  ///
  /// Example:
  /// ```dart
  /// Text('Hello World').wordSpacing(5.0)
  /// ```
  Text wordSpacing(double spacing) =>
      _copyWith(style: TextStyle(wordSpacing: spacing));

  /// Sets font weight to thin (w100)
  Text get thin =>
      _copyWith(style: const TextStyle(fontWeight: FontWeight.w100));

  /// Sets font weight to extra light (w200)
  Text get extraLight =>
      _copyWith(style: const TextStyle(fontWeight: FontWeight.w200));

  /// Sets font weight to light (w300)
  Text get light =>
      _copyWith(style: const TextStyle(fontWeight: FontWeight.w300));

  /// Sets font weight to normal (w400)
  Text get normal =>
      _copyWith(style: const TextStyle(fontWeight: FontWeight.w400));

  /// Sets font weight to medium (w500)
  Text get medium =>
      _copyWith(style: const TextStyle(fontWeight: FontWeight.w500));

  /// Sets font weight to semi-bold (w600)
  Text get semiBold =>
      _copyWith(style: const TextStyle(fontWeight: FontWeight.w600));

  /// Sets font weight to bold (w700)
  Text get bold =>
      _copyWith(style: const TextStyle(fontWeight: FontWeight.w700));

  /// Sets font weight to extra bold (w800)
  Text get extraBold =>
      _copyWith(style: const TextStyle(fontWeight: FontWeight.w800));

  /// Sets font weight to black (w900)
  Text get black =>
      _copyWith(style: const TextStyle(fontWeight: FontWeight.w900));

  /// Sets font style to italic
  Text get italic =>
      _copyWith(style: const TextStyle(fontStyle: FontStyle.italic));

  /// Sets maximum number of lines for the text
  ///
  /// Example:
  /// ```dart
  /// Text('Long text...').maxLine(2)
  /// ```
  Text maxLine([int? maxLines]) => _copyWith(maxLines: maxLines ?? 1);

  /// Internal method to create a new [Text] widget with modified properties
  Text _copyWith(
          {Key? key,
          StrutStyle? strutStyle,
          TextAlign? textAlign,
          TextDirection? textDirection = TextDirection.ltr,
          Locale? locale,
          bool? softWrap,
          TextOverflow? overflow,
          TextScaler? textScaler,
          int? maxLines,
          String? semanticsLabel,
          TextWidthBasis? textWidthBasis,
          TextStyle? style}) =>
      Text(data!,
          key: key ?? this.key,
          strutStyle: strutStyle ?? this.strutStyle,
          textAlign: textAlign ?? this.textAlign,
          textDirection: textDirection ?? this.textDirection,
          locale: locale ?? this.locale,
          softWrap: softWrap ?? this.softWrap,
          overflow: overflow ?? this.overflow,
          textScaler: textScaler ?? this.textScaler,
          maxLines: maxLines ?? this.maxLines,
          semanticsLabel: semanticsLabel ?? this.semanticsLabel,
          textWidthBasis: textWidthBasis ?? this.textWidthBasis,
          style:
              style != null ? this.style?.merge(style) ?? style : this.style);
}
