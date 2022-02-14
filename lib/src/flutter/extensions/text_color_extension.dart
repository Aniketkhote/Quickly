import 'package:flutter/material.dart';
import '../utilities/colors.dart';

/// Custom color palette
extension TextWidget on Text {
  Text get primary => _copyWith(FxColor.primary);
  Text get secondary => _copyWith(FxColor.secondary);
  Text get success => _copyWith(FxColor.success);
  Text get info => _copyWith(FxColor.info);
  Text get warning => _copyWith(FxColor.warning);
  Text get danger => _copyWith(FxColor.danger);
  Text get light => _copyWith(FxColor.light);
  Text get dark => _copyWith(FxColor.dark);

  Text get kcText => _copyWith(FxColor.kcText);
  Text get kcLabel => _copyWith(FxColor.kcLabel);
  Text get kcDisabled => _copyWith(FxColor.kcDisabled);
  Text get kcTextField => _copyWith(FxColor.kcTextField);

  // Status Colors
  Text get kcWarningStatus => _copyWith(FxColor.kcWarningStatus);
  Text get kcDangerStatus => _copyWith(FxColor.kcDangerStatus);
  Text get kcSuccessStatus => _copyWith(FxColor.kcSuccessStatus);

  // Light Status Colors
  Text get kcWarningLightStatus => _copyWith(FxColor.kcWarningLightStatus);
  Text get kcDangerLightStatus => _copyWith(FxColor.kcDangerLightStatus);
  Text get kcSuccessLightStatus => _copyWith(FxColor.kcSuccessLightStatus);

  Text get gray50 => _copyWith(FxColor.gray50);
  Text get gray100 => _copyWith(FxColor.gray100);
  Text get gray200 => _copyWith(FxColor.gray200);
  Text get gray300 => _copyWith(FxColor.gray300);
  Text get gray400 => _copyWith(FxColor.gray400);
  Text get gray500 => _copyWith(FxColor.gray500);
  Text get gray600 => _copyWith(FxColor.gray600);
  Text get gray700 => _copyWith(FxColor.gray700);
  Text get gray800 => _copyWith(FxColor.gray800);
  Text get gray900 => _copyWith(FxColor.gray900);

  Text get neutral50 => _copyWith(FxColor.neutral50);
  Text get neutral100 => _copyWith(FxColor.neutral100);
  Text get neutral200 => _copyWith(FxColor.neutral200);
  Text get neutral300 => _copyWith(FxColor.neutral300);
  Text get neutral400 => _copyWith(FxColor.neutral400);
  Text get neutral500 => _copyWith(FxColor.neutral500);
  Text get neutral600 => _copyWith(FxColor.neutral600);
  Text get neutral700 => _copyWith(FxColor.neutral700);
  Text get neutral800 => _copyWith(FxColor.neutral800);
  Text get neutral900 => _copyWith(FxColor.neutral900);

  Text get amber50 => _copyWith(FxColor.amber50);
  Text get amber100 => _copyWith(FxColor.amber100);
  Text get amber200 => _copyWith(FxColor.amber200);
  Text get amber300 => _copyWith(FxColor.amber300);
  Text get amber400 => _copyWith(FxColor.amber400);
  Text get amber500 => _copyWith(FxColor.amber500);
  Text get amber600 => _copyWith(FxColor.amber600);
  Text get amber700 => _copyWith(FxColor.amber700);
  Text get amber800 => _copyWith(FxColor.amber800);
  Text get amber900 => _copyWith(FxColor.amber900);

  Text get red50 => _copyWith(FxColor.red50);
  Text get red100 => _copyWith(FxColor.red100);
  Text get red200 => _copyWith(FxColor.red200);
  Text get red300 => _copyWith(FxColor.red300);
  Text get red400 => _copyWith(FxColor.red400);
  Text get red500 => _copyWith(FxColor.red500);
  Text get red600 => _copyWith(FxColor.red600);
  Text get red700 => _copyWith(FxColor.red700);
  Text get red800 => _copyWith(FxColor.red800);
  Text get red900 => _copyWith(FxColor.red900);

  Text get green50 => _copyWith(FxColor.green50);
  Text get green100 => _copyWith(FxColor.green100);
  Text get green200 => _copyWith(FxColor.green200);
  Text get green300 => _copyWith(FxColor.green300);
  Text get green400 => _copyWith(FxColor.green400);
  Text get green500 => _copyWith(FxColor.green500);
  Text get green600 => _copyWith(FxColor.green600);
  Text get green700 => _copyWith(FxColor.green700);
  Text get green800 => _copyWith(FxColor.green800);
  Text get green900 => _copyWith(FxColor.green900);

  Text get blue50 => _copyWith(FxColor.blue50);
  Text get blue100 => _copyWith(FxColor.blue100);
  Text get blue200 => _copyWith(FxColor.blue200);
  Text get blue300 => _copyWith(FxColor.blue300);
  Text get blue400 => _copyWith(FxColor.blue400);
  Text get blue500 => _copyWith(FxColor.blue500);
  Text get blue600 => _copyWith(FxColor.blue600);
  Text get blue700 => _copyWith(FxColor.blue700);
  Text get blue800 => _copyWith(FxColor.blue800);
  Text get blue900 => _copyWith(FxColor.blue900);

  Text get violet50 => _copyWith(FxColor.violet50);
  Text get violet100 => _copyWith(FxColor.violet100);
  Text get violet200 => _copyWith(FxColor.violet200);
  Text get violet300 => _copyWith(FxColor.violet300);
  Text get violet400 => _copyWith(FxColor.violet400);
  Text get violet500 => _copyWith(FxColor.violet500);
  Text get violet600 => _copyWith(FxColor.violet600);
  Text get violet700 => _copyWith(FxColor.violet700);
  Text get violet800 => _copyWith(FxColor.violet800);
  Text get violet900 => _copyWith(FxColor.violet900);

  Text _copyWith(Color? color) => Text(data!, style: TextStyle(color: color));
}
