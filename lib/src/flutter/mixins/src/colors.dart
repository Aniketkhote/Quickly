import 'package:flutter/material.dart';

/// Custom color palette for easy access to predefined color options.
/// This abstract class provides a set of static color constants for consistent theming across the application.
abstract class FxColor {
  /// The primary color of the application.
  /// Used for key UI elements and primary actions.
  static const Color primary = Color(0xFF006EFF);

  /// The secondary color of the application.
  /// Used for complementary UI elements and secondary actions.
  static const Color secondary = Color(0xFFE4E6EF);

  /// The color used to indicate successful actions or positive states.
  static const Color success = Color(0xFF2ED477);

  /// The color used for informational elements or neutral states.
  static const Color info = Color(0xFF8950FC);

  /// The color used to indicate warnings or caution states.
  static const Color warning = Color(0xFFFF9138);

  /// The color used to indicate errors or dangerous actions.
  static const Color danger = Color(0xFFF46363);

  /// A light color, typically used for backgrounds or light-themed elements.
  static const Color light = Color(0xFFF3F6F9);

  /// A dark color, typically used for text or dark-themed elements.
  static const Color dark = Color(0xFF222428);

  /// Pure white color.
  static const Color white = Color(0xFFFFFFFF);

  /// Pure black color.
  static const Color black = Color(0xFF000000);

  /// Fully transparent color.
  static const Color transparent = Color(0x00000000);

  /// The primary text color used in the application.
  static const Color kcText = Color(0xFF565360);

  /// The color used for labels or secondary text.
  static const Color kcLabel = Color(0xFF78858F);

  /// The color used for disabled elements or text.
  static const Color kcDisabled = Color(0xFFE1DFE9);

  /// The background color used for text fields.
  static const Color kcTextField = Color(0xFFF3F3F3);

  /// A lighter shade of the warning color, used for backgrounds or subtle warnings.
  static const Color kcWarningLight = Color(0xFFFFF8DE);

  /// A lighter shade of the danger color, used for backgrounds or subtle errors.
  static const Color kcDangerLight = Color(0xFFFFF3F3);

  /// A lighter shade of the success color, used for backgrounds or subtle success indicators.
  static const Color kcSuccessLight = Color(0xFFE2F8E9);

  /// A set of gray scale colors from lightest to darkest.
  /// These can be used for various UI elements requiring different shades of gray.
  static const Color gray50 = Color(0xFFf9fafb);
  static const Color gray100 = Color(0xFFf3f4f6);
  static const Color gray200 = Color(0xFFe5e7eb);
  static const Color gray300 = Color(0xFFd1d5db);
  static const Color gray400 = Color(0xFF9ca3af);
  static const Color gray500 = Color(0xFF6b7280);
  static const Color gray600 = Color(0xFF4b5563);
  static const Color gray700 = Color(0xFF374151);
  static const Color gray800 = Color(0xFF1f2937);
  static const Color gray900 = Color(0xFF111827);

  /// A set of neutral scale colors from lightest to darkest.
  /// These provide a range of neutral tones for UI elements.
  static const Color neutral50 = Color(0xFFfafafa);
  static const Color neutral100 = Color(0xFFf5f5f5);
  static const Color neutral200 = Color(0xFFe5e5e5);
  static const Color neutral300 = Color(0xFFd4d4d4);
  static const Color neutral400 = Color(0xFFa3a3a3);
  static const Color neutral500 = Color(0xFF737373);
  static const Color neutral600 = Color(0xFF525252);
  static const Color neutral700 = Color(0xFF404040);
  static const Color neutral800 = Color(0xFF262626);
  static const Color neutral900 = Color(0xFF171717);

  /// A set of amber scale colors from lightest to darkest.
  /// These can be used for warning states or amber-themed elements.
  static const Color amber50 = Color(0xFFfffbeb);
  static const Color amber100 = Color(0xFFfef3c7);
  static const Color amber200 = Color(0xFFfde68a);
  static const Color amber300 = Color(0xFFfcd34d);
  static const Color amber400 = Color(0xFFfbbf24);
  static const Color amber500 = Color(0xFFf59e0b);
  static const Color amber600 = Color(0xFFd97706);
  static const Color amber700 = Color(0xFFb45309);
  static const Color amber800 = Color(0xFF92400e);
  static const Color amber900 = Color(0xFF78350f);

  /// A set of red scale colors from lightest to darkest.
  /// These can be used for error states or red-themed elements.
  static const Color red50 = Color(0xFFfef2f2);
  static const Color red100 = Color(0xFFfee2e2);
  static const Color red200 = Color(0xFFfecaca);
  static const Color red300 = Color(0xFFfca5a5);
  static const Color red400 = Color(0xFFf87171);
  static const Color red500 = Color(0xFFef4444);
  static const Color red600 = Color(0xFFdc2626);
  static const Color red700 = Color(0xFFb91c1c);
  static const Color red800 = Color(0xFF991b1b);
  static const Color red900 = Color(0xFF7f1d1d);

  /// A set of green scale colors from lightest to darkest.
  /// These can be used for success states or green-themed elements.
  static const Color green50 = Color(0xFFf0fdf4);
  static const Color green100 = Color(0xFFdcfce7);
  static const Color green200 = Color(0xFFbbf7d0);
  static const Color green300 = Color(0xFF86efac);
  static const Color green400 = Color(0xFF4ade80);
  static const Color green500 = Color(0xFF22c55e);
  static const Color green600 = Color(0xFF16a34a);
  static const Color green700 = Color(0xFF15803d);
  static const Color green800 = Color(0xFF166534);
  static const Color green900 = Color(0xFF14532d);

  /// A set of blue scale colors from lightest to darkest.
  /// These can be used for informational states or blue-themed elements.
  static const Color blue50 = Color(0xFFeff6ff);
  static const Color blue100 = Color(0xFFdbeafe);
  static const Color blue200 = Color(0xFFbfdbfe);
  static const Color blue300 = Color(0xFF93c5fd);
  static const Color blue400 = Color(0xFF60a5fa);
  static const Color blue500 = Color(0xFF3b82f6);
  static const Color blue600 = Color(0xFF2563eb);
  static const Color blue700 = Color(0xFF1d4ed8);
  static const Color blue800 = Color(0xFF1e40af);
  static const Color blue900 = Color(0xFF1e3a8a);

  /// A set of violet scale colors from lightest to darkest.
  /// These can be used for accent states or violet-themed elements.
  static const Color violet50 = Color(0xFFf5f3ff);
  static const Color violet100 = Color(0xFFede9fe);
  static const Color violet200 = Color(0xFFddd6fe);
  static const Color violet300 = Color(0xFFc4b5fd);
  static const Color violet400 = Color(0xFFa78bfa);
  static const Color violet500 = Color(0xFF8b5cf6);
  static const Color violet600 = Color(0xFF7c3aed);
  static const Color violet700 = Color(0xFF6d28d9);
  static const Color violet800 = Color(0xFF5b21b6);
  static const Color violet900 = Color(0xFF4c1d95);
}
