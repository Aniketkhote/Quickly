import 'package:flutter/material.dart';
import '../mixins.dart';

/// Custom color palette
extension TextColorExtension on Text {
  Text get kcPrimary => _color(FxColor.primary);
  Text get kcSecondary => _color(FxColor.secondary);
  Text get kcSuccess => _color(FxColor.success);
  Text get kcInfo => _color(FxColor.info);
  Text get kcWarning => _color(FxColor.warning);
  Text get kcDanger => _color(FxColor.danger);
  Text get kcLight => _color(FxColor.light);
  Text get kcDark => _color(FxColor.dark);
  Text get black => _color(FxColor.black);
  Text get white => _color(FxColor.white);

  Text get kcText => _color(FxColor.kcText);
  Text get kcLabel => _color(FxColor.kcLabel);
  Text get kcDisabled => _color(FxColor.kcDisabled);
  Text get kcTextField => _color(FxColor.kcTextField);

  // Status Colors
  Text get kcWarningStatus => _color(FxColor.kcWarningStatus);
  Text get kcDangerStatus => _color(FxColor.kcDangerStatus);
  Text get kcSuccessStatus => _color(FxColor.kcSuccessStatus);

  // Light Status Colors
  Text get kcWarningLightStatus => _color(FxColor.kcWarningLightStatus);
  Text get kcDangerLightStatus => _color(FxColor.kcDangerLightStatus);
  Text get kcSuccessLightStatus => _color(FxColor.kcSuccessLightStatus);

  Text get gray50 => _color(FxColor.gray50);
  Text get gray100 => _color(FxColor.gray100);
  Text get gray200 => _color(FxColor.gray200);
  Text get gray300 => _color(FxColor.gray300);
  Text get gray400 => _color(FxColor.gray400);
  Text get gray500 => _color(FxColor.gray500);
  Text get gray600 => _color(FxColor.gray600);
  Text get gray700 => _color(FxColor.gray700);
  Text get gray800 => _color(FxColor.gray800);
  Text get gray900 => _color(FxColor.gray900);

  Text get neutral50 => _color(FxColor.neutral50);
  Text get neutral100 => _color(FxColor.neutral100);
  Text get neutral200 => _color(FxColor.neutral200);
  Text get neutral300 => _color(FxColor.neutral300);
  Text get neutral400 => _color(FxColor.neutral400);
  Text get neutral500 => _color(FxColor.neutral500);
  Text get neutral600 => _color(FxColor.neutral600);
  Text get neutral700 => _color(FxColor.neutral700);
  Text get neutral800 => _color(FxColor.neutral800);
  Text get neutral900 => _color(FxColor.neutral900);

  Text get amber50 => _color(FxColor.amber50);
  Text get amber100 => _color(FxColor.amber100);
  Text get amber200 => _color(FxColor.amber200);
  Text get amber300 => _color(FxColor.amber300);
  Text get amber400 => _color(FxColor.amber400);
  Text get amber500 => _color(FxColor.amber500);
  Text get amber600 => _color(FxColor.amber600);
  Text get amber700 => _color(FxColor.amber700);
  Text get amber800 => _color(FxColor.amber800);
  Text get amber900 => _color(FxColor.amber900);

  Text get red50 => _color(FxColor.red50);
  Text get red100 => _color(FxColor.red100);
  Text get red200 => _color(FxColor.red200);
  Text get red300 => _color(FxColor.red300);
  Text get red400 => _color(FxColor.red400);
  Text get red500 => _color(FxColor.red500);
  Text get red600 => _color(FxColor.red600);
  Text get red700 => _color(FxColor.red700);
  Text get red800 => _color(FxColor.red800);
  Text get red900 => _color(FxColor.red900);

  Text get green50 => _color(FxColor.green50);
  Text get green100 => _color(FxColor.green100);
  Text get green200 => _color(FxColor.green200);
  Text get green300 => _color(FxColor.green300);
  Text get green400 => _color(FxColor.green400);
  Text get green500 => _color(FxColor.green500);
  Text get green600 => _color(FxColor.green600);
  Text get green700 => _color(FxColor.green700);
  Text get green800 => _color(FxColor.green800);
  Text get green900 => _color(FxColor.green900);

  Text get blue50 => _color(FxColor.blue50);
  Text get blue100 => _color(FxColor.blue100);
  Text get blue200 => _color(FxColor.blue200);
  Text get blue300 => _color(FxColor.blue300);
  Text get blue400 => _color(FxColor.blue400);
  Text get blue500 => _color(FxColor.blue500);
  Text get blue600 => _color(FxColor.blue600);
  Text get blue700 => _color(FxColor.blue700);
  Text get blue800 => _color(FxColor.blue800);
  Text get blue900 => _color(FxColor.blue900);

  Text get violet50 => _color(FxColor.violet50);
  Text get violet100 => _color(FxColor.violet100);
  Text get violet200 => _color(FxColor.violet200);
  Text get violet300 => _color(FxColor.violet300);
  Text get violet400 => _color(FxColor.violet400);
  Text get violet500 => _color(FxColor.violet500);
  Text get violet600 => _color(FxColor.violet600);
  Text get violet700 => _color(FxColor.violet700);
  Text get violet800 => _color(FxColor.violet800);
  Text get violet900 => _color(FxColor.violet900);

  Text _color(Color color) => _style(TextStyle(color: color));

  Text _style(TextStyle? style) => Text(data!,
      style: style != null ? this.style?.merge(style) ?? style : this.style);
}
