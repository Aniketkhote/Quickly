import 'package:flutter/material.dart';
import '../utilities/colors.dart';

/// Custom color palette
extension TextWidget on Text {
  Text get primary => _copyWith(color: FxColor.primary);
  Text get secondary => _copyWith(color: FxColor.secondary);
  Text get success => _copyWith(color: FxColor.success);
  Text get info => _copyWith(color: FxColor.info);
  Text get warning => _copyWith(color: FxColor.warning);
  Text get danger => _copyWith(color: FxColor.danger);
  Text get light => _copyWith(color: FxColor.light);
  Text get dark => _copyWith(color: FxColor.dark);

  Text get kcText => _copyWith(color: FxColor.kcText);
  Text get kcLabel => _copyWith(color: FxColor.kcLabel);
  Text get kcDisabled => _copyWith(color: FxColor.kcDisabled);
  Text get kcTextField => _copyWith(color: FxColor.kcTextField);

  // Status Colors
  Text get kcWarningStatus => _copyWith(color: FxColor.kcWarningStatus);
  Text get kcDangerStatus => _copyWith(color: FxColor.kcDangerStatus);
  Text get kcSuccessStatus => _copyWith(color: FxColor.kcSuccessStatus);

  // Light Status Colors
  Text get kcWarningLightStatus =>
      _copyWith(color: FxColor.kcWarningLightStatus);
  Text get kcDangerLightStatus => _copyWith(color: FxColor.kcDangerLightStatus);
  Text get kcSuccessLightStatus =>
      _copyWith(color: FxColor.kcSuccessLightStatus);

  Text get gray50 => _copyWith(color: FxColor.gray50);
  Text get gray100 => _copyWith(color: FxColor.gray100);
  Text get gray200 => _copyWith(color: FxColor.gray200);
  Text get gray300 => _copyWith(color: FxColor.gray300);
  Text get gray400 => _copyWith(color: FxColor.gray400);
  Text get gray500 => _copyWith(color: FxColor.gray500);
  Text get gray600 => _copyWith(color: FxColor.gray600);
  Text get gray700 => _copyWith(color: FxColor.gray700);
  Text get gray800 => _copyWith(color: FxColor.gray800);
  Text get gray900 => _copyWith(color: FxColor.gray900);

  Text get neutral50 => _copyWith(color: FxColor.neutral50);
  Text get neutral100 => _copyWith(color: FxColor.neutral100);
  Text get neutral200 => _copyWith(color: FxColor.neutral200);
  Text get neutral300 => _copyWith(color: FxColor.neutral300);
  Text get neutral400 => _copyWith(color: FxColor.neutral400);
  Text get neutral500 => _copyWith(color: FxColor.neutral500);
  Text get neutral600 => _copyWith(color: FxColor.neutral600);
  Text get neutral700 => _copyWith(color: FxColor.neutral700);
  Text get neutral800 => _copyWith(color: FxColor.neutral800);
  Text get neutral900 => _copyWith(color: FxColor.neutral900);

  Text get amber50 => _copyWith(color: FxColor.amber50);
  Text get amber100 => _copyWith(color: FxColor.amber100);
  Text get amber200 => _copyWith(color: FxColor.amber200);
  Text get amber300 => _copyWith(color: FxColor.amber300);
  Text get amber400 => _copyWith(color: FxColor.amber400);
  Text get amber500 => _copyWith(color: FxColor.amber500);
  Text get amber600 => _copyWith(color: FxColor.amber600);
  Text get amber700 => _copyWith(color: FxColor.amber700);
  Text get amber800 => _copyWith(color: FxColor.amber800);
  Text get amber900 => _copyWith(color: FxColor.amber900);

  Text get red50 => _copyWith(color: FxColor.red50);
  Text get red100 => _copyWith(color: FxColor.red100);
  Text get red200 => _copyWith(color: FxColor.red200);
  Text get red300 => _copyWith(color: FxColor.red300);
  Text get red400 => _copyWith(color: FxColor.red400);
  Text get red500 => _copyWith(color: FxColor.red500);
  Text get red600 => _copyWith(color: FxColor.red600);
  Text get red700 => _copyWith(color: FxColor.red700);
  Text get red800 => _copyWith(color: FxColor.red800);
  Text get red900 => _copyWith(color: FxColor.red900);

  Text get green50 => _copyWith(color: FxColor.green50);
  Text get green100 => _copyWith(color: FxColor.green100);
  Text get green200 => _copyWith(color: FxColor.green200);
  Text get green300 => _copyWith(color: FxColor.green300);
  Text get green400 => _copyWith(color: FxColor.green400);
  Text get green500 => _copyWith(color: FxColor.green500);
  Text get green600 => _copyWith(color: FxColor.green600);
  Text get green700 => _copyWith(color: FxColor.green700);
  Text get green800 => _copyWith(color: FxColor.green800);
  Text get green900 => _copyWith(color: FxColor.green900);

  Text get blue50 => _copyWith(color: FxColor.blue50);
  Text get blue100 => _copyWith(color: FxColor.blue100);
  Text get blue200 => _copyWith(color: FxColor.blue200);
  Text get blue300 => _copyWith(color: FxColor.blue300);
  Text get blue400 => _copyWith(color: FxColor.blue400);
  Text get blue500 => _copyWith(color: FxColor.blue500);
  Text get blue600 => _copyWith(color: FxColor.blue600);
  Text get blue700 => _copyWith(color: FxColor.blue700);
  Text get blue800 => _copyWith(color: FxColor.blue800);
  Text get blue900 => _copyWith(color: FxColor.blue900);

  Text get violet50 => _copyWith(color: FxColor.violet50);
  Text get violet100 => _copyWith(color: FxColor.violet100);
  Text get violet200 => _copyWith(color: FxColor.violet200);
  Text get violet300 => _copyWith(color: FxColor.violet300);
  Text get violet400 => _copyWith(color: FxColor.violet400);
  Text get violet500 => _copyWith(color: FxColor.violet500);
  Text get violet600 => _copyWith(color: FxColor.violet600);
  Text get violet700 => _copyWith(color: FxColor.violet700);
  Text get violet800 => _copyWith(color: FxColor.violet800);
  Text get violet900 => _copyWith(color: FxColor.violet900);

  Text _copyWith({Color? color}) => Text(data!, style: TextStyle(color: color));
}
