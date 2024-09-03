import 'package:flutter/material.dart';

class AppTextTheme {
  static const TextTheme lightTextTheme = TextTheme(
    
    displayLarge: null, // 57
    displayMedium: null, // 45
    displaySmall: null, // 36
    headlineLarge: null, // 32
    headlineMedium: null, // 28
    headlineSmall: null, // 24
    titleLarge: null, // 22
    titleMedium: null, // 16
    titleSmall: null, // 14
    labelLarge: null, // 14
    labelMedium: null, // 12
    labelSmall: null, // 11
    bodyLarge: null, // 16
    bodyMedium: null, // 14
    bodySmall: null, // 12
  );

  static const TextTheme darkTextTheme = TextTheme(
    displayLarge: null,
    displayMedium: null,
    displaySmall: null,
    headlineLarge: null,
    headlineMedium: null,
    headlineSmall: null,
    titleLarge: null,
    titleMedium: null,
    titleSmall: null,
    labelLarge: null,
    labelMedium: null,
    labelSmall: null,
    bodyLarge: null,
    bodyMedium: null,
    bodySmall: null,
  );
}

extension ToTextStyle on TextTheme {
   TextStyle? get titleMediumPlus => TextStyle(
        fontSize: 18,
      );
  TextStyle? get bodySmallMinus => TextStyle(
        fontSize: 9,
      );
  TextStyle? get bodySmallMoreMinus => TextStyle(
        fontSize: 7,
      );
  TextStyle? get bodySmallPlus => TextStyle(
        fontSize: 11,
      );
 
  TextStyle? get bodyMediumMinus => TextStyle(
        fontSize: 13,
      );

  TextStyle? get buttonMedium => TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      );
}
