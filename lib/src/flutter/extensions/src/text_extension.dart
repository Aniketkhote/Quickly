import 'package:flutter/material.dart';

///Text extension to directly style on Text
extension TextExtension on Text {
  ///Apply [TextStyle] to existing textstyle
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

  ///Sets [fontSize] to this text
  Text fontSize(double fontSize) =>
      _copyWith(style: TextStyle(fontSize: fontSize));

  ///Sets [fontSize] to 96 logical pixel and [fontWeight] to light
  Text get h1 => _copyWith(
      style: const TextStyle(fontSize: 96.0, fontWeight: FontWeight.w300));

  ///Sets [fontSize] to 60 logical pixel and [fontWeight] to light
  Text get h2 => _copyWith(
      style: const TextStyle(fontSize: 60.0, fontWeight: FontWeight.w300));

  ///Sets [fontSize] to 48 logical pixel and [fontWeight] to regular
  Text get h3 => _copyWith(style: const TextStyle(fontSize: 48.0));

  ///Sets [fontSize] to 34 logical pixel and [fontWeight] to regular
  Text get h4 => _copyWith(style: const TextStyle(fontSize: 34.0));

  ///Sets [fontSize] to 24 logical pixel and [fontWeight] to regular
  Text get h5 => _copyWith(style: const TextStyle(fontSize: 24.0));

  ///Sets [fontSize] to 20 logical pixel and [fontWeight] to medium
  Text get h6 => _copyWith(
      style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500));

  ///Sets [fontSize] to 16 logical pixel and [fontWeight] to Light
  Text get body1 => _copyWith(style: const TextStyle(fontSize: 16.0));

  ///Sets [fontSize] to 14 logical pixel and [fontWeight] to Light
  Text get body2 => _copyWith(
      style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500));

  ///Sets [fontSize] to 12 logical pixel and [fontWeight] to Light
  Text get caption1 => _copyWith(style: const TextStyle(fontSize: 12.0));

  ///Sets [fontSize] to 10 logical pixel and [fontWeight] to Light
  Text get caption2 => _copyWith(style: const TextStyle(fontSize: 10.0));

  /// Sets custom [lineHeight] with [height]
  Text lineHeight(double height) => _copyWith(style: TextStyle(height: height));

  ///Sets text color with either [Colors] or [FxColors]
  Text color(Color color) => _copyWith(style: TextStyle(color: color));

  ///Sets text background color with either [Colors] or [FxColors]
  Text bgColor(Color backgroundColor) =>
      _copyWith(style: TextStyle(backgroundColor: backgroundColor));

  ///Align the text on the left edge of the container.
  Text get textLeft => _copyWith(textAlign: TextAlign.left);

  ///Align the text on the right edge of the container.
  Text get textRight => _copyWith(textAlign: TextAlign.right);

  ///Align the text in the center of the container.
  Text get textCenter => _copyWith(textAlign: TextAlign.center);

  ///Lines that end with hard line breaks are aligned towards the [start] edge.
  Text get textJustify => _copyWith(textAlign: TextAlign.justify);

  ///Align the text start edge of the container
  Text get textStart => _copyWith(textAlign: TextAlign.start);

  ///Align the text end edge of the container
  Text get textEnd => _copyWith(textAlign: TextAlign.end);

  ///The text flows from right to left (e.g. Arabic, Hebrew).
  Text get rtl => _copyWith(textDirection: TextDirection.rtl);

  ///If false, the glyphs in the text will be positioned as if there was unlimited horizontal space.
  Text softWrap(bool softWrap) => _copyWith(softWrap: softWrap);

  /// Render overflowing text outside of its container.
  Text get visible => _copyWith(overflow: TextOverflow.visible);

  /// [Clip] the overflowing text to fix its container.
  Text get clip => _copyWith(overflow: TextOverflow.clip);

  /// [Fade] the overflowing text to transparent.
  Text get fade => _copyWith(overflow: TextOverflow.fade);

  /// Use an [ellipsis] to indicate that the text has overflowed.
  Text get ellipsis => _copyWith(overflow: TextOverflow.ellipsis);

  /// Draw a line underneath each line of text
  Text get underline =>
      _copyWith(style: const TextStyle(decoration: TextDecoration.underline));

  ///Set [fontFamily] for the text
  Text fontFamily(String fontFamily) =>
      _copyWith(style: TextStyle(fontFamily: fontFamily));

  ///set [TextScaler] to text
  Text textScale(TextScaler textScaler) => _copyWith(textScaler: textScaler);

  /// Sets [TextScaler] to extra small i.e. 0.75
  Text get xs => _copyWith(textScaler: const TextScaler.linear(.75));

  /// Sets [TextScaler] to small i.e. 0.875
  Text get sm => _copyWith(textScaler: const TextScaler.linear(0.875));

  /// Sets [TextScaler] to md i.e. 1 or default
  Text get md => _copyWith(textScaler: TextScaler.noScaling);

  /// Sets [TextScaler] to large i.e. 1.125
  Text get lg => _copyWith(textScaler: const TextScaler.linear(1.125));

  /// Sets [TextScaler] to extra large i.e. 1.25
  Text get xl => _copyWith(textScaler: const TextScaler.linear(1.25));

  /// Sets [TextScaler] to twice extra large i.e. 1.5
  Text get xl2 => _copyWith(textScaler: const TextScaler.linear(1.5));

  /// Sets [TextScaler] to thrice extra large i.e. 1.875
  Text get xl3 => _copyWith(textScaler: const TextScaler.linear(1.875));

  /// Sets [TextScaler] to four times extra large i.e. 2.25
  Text get xl4 => _copyWith(textScaler: const TextScaler.linear(2.25));

  /// Sets [TextScaler] to five times extra large i.e. 3
  Text get xl5 => _copyWith(textScaler: const TextScaler.linear(3.0));

  /// Sets [TextScaler] to six times extra large i.e. 4
  Text get xl6 => _copyWith(textScaler: const TextScaler.linear(4.0));

  ///A negative value can be used to bring the letters closer.
  Text letterSpacing(double spacing) =>
      _copyWith(style: TextStyle(letterSpacing: spacing));

  ///The amount of space (in logical pixels) to add at each sequence of white-space
  ///
  ///(i.e. between each word).
  ///A negative value can be used to bring the words closer.
  Text wordSpacing(double spacing) =>
      _copyWith(style: TextStyle(wordSpacing: spacing));

  ///Sets [fontWeight] to [FontWeight.w100]
  Text get thin =>
      _copyWith(style: const TextStyle(fontWeight: FontWeight.w100));

  ///Sets [fontWeight] to [FontWeight.w200]
  Text get extraLight =>
      _copyWith(style: const TextStyle(fontWeight: FontWeight.w200));

  ///Sets [fontWeight] to [FontWeight.w300]
  Text get light =>
      _copyWith(style: const TextStyle(fontWeight: FontWeight.w300));

  ///Sets [fontWeight] to [FontWeight.w400]
  Text get normal =>
      _copyWith(style: const TextStyle(fontWeight: FontWeight.w400));

  ///Sets [fontWeight] to [FontWeight.w500]
  Text get medium =>
      _copyWith(style: const TextStyle(fontWeight: FontWeight.w500));

  ///Sets [fontWeight] to [FontWeight.w600]
  Text get bold =>
      _copyWith(style: const TextStyle(fontWeight: FontWeight.w600));

  ///Sets [fontWeight] to [FontWeight.w700]
  Text get semiBold =>
      _copyWith(style: const TextStyle(fontWeight: FontWeight.w700));

  ///Sets [fontWeight] to [FontWeight.w800]
  Text get extraBold =>
      _copyWith(style: const TextStyle(fontWeight: FontWeight.w800));

  ///Sets [fontWeight] to [FontWeight.w900]
  Text get darkBold =>
      _copyWith(style: const TextStyle(fontWeight: FontWeight.w900));

  ///Use glyphs designed for slanting
  Text get italic =>
      _copyWith(style: const TextStyle(fontStyle: FontStyle.italic));

  ///An optional maximum number of lines for the text to span, wrapping if necessary.
  ///
  ///If the text exceeds the given number of lines, it will be truncated according to [overflow].
  ///If this is 1, text will not wrap. Otherwise, text will be wrapped at the edge of the box.
  Text maxLine([int? maxLines]) => _copyWith(maxLines: maxLines ?? 1);

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
