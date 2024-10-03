import 'package:flutter/material.dart';
import 'package:quickly/quickly.dart';

/// Custom color extension for the Text widget. This extension provides getter methods
/// for various commonly used colors in the application, allowing easy color application to Text widgets.
extension TextColorExtension on Text {
  /// Returns a new Text widget with the Primary color applied.
  ///
  /// This getter creates a copy of the current Text widget with the primary color from FxColor.
  Text get kcPrimary => color(FxColor.primary);

  /// Returns a new Text widget with the Secondary color applied.
  ///
  /// This getter creates a copy of the current Text widget with the secondary color from FxColor.
  Text get kcSecondary => color(FxColor.secondary);

  /// Returns a new Text widget with the Success color applied.
  ///
  /// This getter creates a copy of the current Text widget with the success color from FxColor.
  Text get kcSuccess => color(FxColor.success);

  /// Returns a new Text widget with the Info color applied.
  ///
  /// This getter creates a copy of the current Text widget with the info color from FxColor.
  Text get kcInfo => color(FxColor.info);

  /// Returns a new Text widget with the Warning color applied.
  ///
  /// This getter creates a copy of the current Text widget with the warning color from FxColor.
  Text get kcWarning => color(FxColor.warning);

  /// Returns a new Text widget with the Danger color applied.
  ///
  /// This getter creates a copy of the current Text widget with the danger color from FxColor.
  Text get kcDanger => color(FxColor.danger);

  /// Returns a new Text widget with the Light color applied.
  ///
  /// This getter creates a copy of the current Text widget with the light color from FxColor.
  Text get kcLight => color(FxColor.light);

  /// Returns a new Text widget with the Dark color applied.
  ///
  /// This getter creates a copy of the current Text widget with the dark color from FxColor.
  Text get kcDark => color(FxColor.dark);

  /// Returns a new Text widget with a Transparent color applied.
  ///
  /// This getter creates a copy of the current Text widget with a transparent color.
  Text get transparent => color(FxColor.transparent);

  /// Returns a new Text widget with a Black color applied.
  ///
  /// This getter creates a copy of the current Text widget with a black color.
  Text get black => color(FxColor.black);

  /// Returns a new Text widget with a White color applied.
  ///
  /// This getter creates a copy of the current Text widget with a white color.
  Text get white => color(FxColor.white);

  /// Returns a new Text widget with the Warning Light color applied.
  ///
  /// This getter creates a copy of the current Text widget with the warning light color from FxColor.
  Text get kcWarningLight => color(FxColor.kcWarningLight);

  /// Returns a new Text widget with the Danger Light color applied.
  ///
  /// This getter creates a copy of the current Text widget with the danger light color from FxColor.
  Text get kcDangerLight => color(FxColor.kcDangerLight);

  /// Returns a new Text widget with the Success Light color applied.
  ///
  /// This getter creates a copy of the current Text widget with the success light color from FxColor.
  Text get kcSuccessLight => color(FxColor.kcSuccessLight);

  /// Returns a new Text widget with the Gray 50 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the gray 50 color from FxColor.
  Text get gray50 => color(FxColor.gray50);

  /// Returns a new Text widget with the Gray 100 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the gray 100 color from FxColor.
  Text get gray100 => color(FxColor.gray100);

  /// Returns a new Text widget with the Gray 200 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the gray 200 color from FxColor.
  Text get gray200 => color(FxColor.gray200);

  /// Returns a new Text widget with the Gray 300 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the gray 300 color from FxColor.
  Text get gray300 => color(FxColor.gray300);

  /// Returns a new Text widget with the Gray 400 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the gray 400 color from FxColor.
  Text get gray400 => color(FxColor.gray400);

  /// Returns a new Text widget with the Gray 500 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the gray 500 color from FxColor.
  Text get gray500 => color(FxColor.gray500);

  /// Returns a new Text widget with the Gray 600 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the gray 600 color from FxColor.
  Text get gray600 => color(FxColor.gray600);

  /// Returns a new Text widget with the Gray 700 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the gray 700 color from FxColor.
  Text get gray700 => color(FxColor.gray700);

  /// Returns a new Text widget with the Gray 800 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the gray 800 color from FxColor.
  Text get gray800 => color(FxColor.gray800);

  /// Returns a new Text widget with the Gray 900 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the gray 900 color from FxColor.
  Text get gray900 => color(FxColor.gray900);

  /// Returns a new Text widget with the Neutral 50 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the neutral 50 color from FxColor.
  Text get neutral50 => color(FxColor.neutral50);

  /// Returns a new Text widget with the Neutral 100 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the neutral 100 color from FxColor.
  Text get neutral100 => color(FxColor.neutral100);

  /// Returns a new Text widget with the Neutral 200 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the neutral 200 color from FxColor.
  Text get neutral200 => color(FxColor.neutral200);

  /// Returns a new Text widget with the Neutral 300 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the neutral 300 color from FxColor.
  Text get neutral300 => color(FxColor.neutral300);

  /// Returns a new Text widget with the Neutral 400 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the neutral 400 color from FxColor.
  Text get neutral400 => color(FxColor.neutral400);

  /// Returns a new Text widget with the Neutral 500 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the neutral 500 color from FxColor.
  Text get neutral500 => color(FxColor.neutral500);

  /// Returns a new Text widget with the Neutral 600 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the neutral 600 color from FxColor.
  Text get neutral600 => color(FxColor.neutral600);

  /// Returns a new Text widget with the Neutral 700 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the neutral 700 color from FxColor.
  Text get neutral700 => color(FxColor.neutral700);

  /// Returns a new Text widget with the Neutral 800 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the neutral 800 color from FxColor.
  Text get neutral800 => color(FxColor.neutral800);

  /// Returns a new Text widget with the Neutral 900 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the neutral 900 color from FxColor.
  Text get neutral900 => color(FxColor.neutral900);

  /// Returns a new Text widget with the Amber 50 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the amber 50 color from FxColor.
  Text get amber50 => color(FxColor.amber50);

  /// Returns a new Text widget with the Amber 100 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the amber 100 color from FxColor.
  Text get amber100 => color(FxColor.amber100);

  /// Returns a new Text widget with the Amber 200 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the amber 200 color from FxColor.
  Text get amber200 => color(FxColor.amber200);

  /// Returns a new Text widget with the Amber 300 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the amber 300 color from FxColor.
  Text get amber300 => color(FxColor.amber300);

  /// Returns a new Text widget with the Amber 400 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the amber 400 color from FxColor.
  Text get amber400 => color(FxColor.amber400);

  /// Returns a new Text widget with the Amber 500 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the amber 500 color from FxColor.
  Text get amber500 => color(FxColor.amber500);

  /// Returns a new Text widget with the Amber 600 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the amber 600 color from FxColor.
  Text get amber600 => color(FxColor.amber600);

  /// Returns a new Text widget with the Amber 700 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the amber 700 color from FxColor.
  Text get amber700 => color(FxColor.amber700);

  /// Returns a new Text widget with the Amber 800 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the amber 800 color from FxColor.
  Text get amber800 => color(FxColor.amber800);

  /// Returns a new Text widget with the Amber 900 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the amber 900 color from FxColor.
  Text get amber900 => color(FxColor.amber900);

  /// Returns a new Text widget with the Red 50 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the red 50 color from FxColor.
  Text get red50 => color(FxColor.red50);

  /// Returns a new Text widget with the Red 100 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the red 100 color from FxColor.
  Text get red100 => color(FxColor.red100);

  /// Returns a new Text widget with the Red 200 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the red 200 color from FxColor.
  Text get red200 => color(FxColor.red200);

  /// Returns a new Text widget with the Red 300 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the red 300 color from FxColor.
  Text get red300 => color(FxColor.red300);

  /// Returns a new Text widget with the Red 400 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the red 400 color from FxColor.
  Text get red400 => color(FxColor.red400);

  /// Returns a new Text widget with the Red 500 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the red 500 color from FxColor.
  Text get red500 => color(FxColor.red500);

  /// Returns a new Text widget with the Red 600 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the red 600 color from FxColor.
  Text get red600 => color(FxColor.red600);

  /// Returns a new Text widget with the Red 700 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the red 700 color from FxColor.
  Text get red700 => color(FxColor.red700);

  /// Returns a new Text widget with the Red 800 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the red 800 color from FxColor.
  Text get red800 => color(FxColor.red800);

  /// Returns a new Text widget with the Red 900 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the red 900 color from FxColor.
  Text get red900 => color(FxColor.red900);

  /// Returns a new Text widget with the Green 50 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the green 50 color from FxColor.
  Text get green50 => color(FxColor.green50);

  /// Returns a new Text widget with the Green 100 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the green 100 color from FxColor.
  Text get green100 => color(FxColor.green100);

  /// Returns a new Text widget with the Green 200 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the green 200 color from FxColor.
  Text get green200 => color(FxColor.green200);

  /// Returns a new Text widget with the Green 300 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the green 300 color from FxColor.
  Text get green300 => color(FxColor.green300);

  /// Returns a new Text widget with the Green 400 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the green 400 color from FxColor.
  Text get green400 => color(FxColor.green400);

  /// Returns a new Text widget with the Green 500 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the green 500 color from FxColor.
  Text get green500 => color(FxColor.green500);

  /// Returns a new Text widget with the Green 600 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the green 600 color from FxColor.
  Text get green600 => color(FxColor.green600);

  /// Returns a new Text widget with the Green 700 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the green 700 color from FxColor.
  Text get green700 => color(FxColor.green700);

  /// Returns a new Text widget with the Green 800 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the green 800 color from FxColor.
  Text get green800 => color(FxColor.green800);

  /// Returns a new Text widget with the Green 900 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the green 900 color from FxColor.
  Text get green900 => color(FxColor.green900);

  /// Returns a new Text widget with the Blue 50 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the blue 50 color from FxColor.
  Text get blue50 => color(FxColor.blue50);

  /// Returns a new Text widget with the Blue 100 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the blue 100 color from FxColor.
  Text get blue100 => color(FxColor.blue100);

  /// Returns a new Text widget with the Blue 200 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the blue 200 color from FxColor.
  Text get blue200 => color(FxColor.blue200);

  /// Returns a new Text widget with the Blue 300 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the blue 300 color from FxColor.
  Text get blue300 => color(FxColor.blue300);

  /// Returns a new Text widget with the Blue 400 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the blue 400 color from FxColor.
  Text get blue400 => color(FxColor.blue400);

  /// Returns a new Text widget with the Blue 500 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the blue 500 color from FxColor.
  Text get blue500 => color(FxColor.blue500);

  /// Returns a new Text widget with the Blue 600 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the blue 600 color from FxColor.
  Text get blue600 => color(FxColor.blue600);

  /// Returns a new Text widget with the Blue 700 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the blue 700 color from FxColor.
  Text get blue700 => color(FxColor.blue700);

  /// Returns a new Text widget with the Blue 800 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the blue 800 color from FxColor.
  Text get blue800 => color(FxColor.blue800);

  /// Returns a new Text widget with the Blue 900 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the blue 900 color from FxColor.
  Text get blue900 => color(FxColor.blue900);

  /// Returns a new Text widget with the Violet 50 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the violet 50 color from FxColor.
  Text get violet50 => color(FxColor.violet50);

  /// Returns a new Text widget with the Violet 100 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the violet 100 color from FxColor.
  Text get violet100 => color(FxColor.violet100);

  /// Returns a new Text widget with the Violet 200 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the violet 200 color from FxColor.
  Text get violet200 => color(FxColor.violet200);

  /// Returns a new Text widget with the Violet 300 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the violet 300 color from FxColor.
  Text get violet300 => color(FxColor.violet300);

  /// Returns a new Text widget with the Violet 400 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the violet 400 color from FxColor.
  Text get violet400 => color(FxColor.violet400);

  /// Returns a new Text widget with the Violet 500 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the violet 500 color from FxColor.
  Text get violet500 => color(FxColor.violet500);

  /// Returns a new Text widget with the Violet 600 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the violet 600 color from FxColor.
  Text get violet600 => color(FxColor.violet600);

  /// Returns a new Text widget with the Violet 700 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the violet 700 color from FxColor.
  Text get violet700 => color(FxColor.violet700);

  /// Returns a new Text widget with the Violet 800 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the violet 800 color from FxColor.
  Text get violet800 => color(FxColor.violet800);

  /// Returns a new Text widget with the Violet 900 color applied.
  ///
  /// This getter creates a copy of the current Text widget with the violet 900 color from FxColor.
  Text get violet900 => color(FxColor.violet900);
}
