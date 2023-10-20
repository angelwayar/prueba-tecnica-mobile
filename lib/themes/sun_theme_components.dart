import 'package:flutter/material.dart';

import '../src/shared/commons/sun_colors.dart';

class SunThemeComponents {
  static final ThemeData _theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
        seedColor: SunColors.colorButtonPrimary,
        primary: SunColors.colorButtonPrimary,
        secondary: SunColors.colorButtonSecondary,
        onPrimary: SunColors.colorWhite,
        onSecondary: SunColors.textBlack,
        onTertiary: SunColors.titlePurple,
        onSurface: SunColors.titleGreyLight,
        onInverseSurface: Colors.red),
    useMaterial3: true,
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: SunColors.titlePurple,
        fontWeight: FontWeight.w700,
        fontFamily: 'Open Sans',
        fontSize: 24,
      ),
      titleMedium: TextStyle(
        color: SunColors.textBlack,
        fontWeight: FontWeight.w700,
        fontFamily: 'Open Sans',
        fontSize: 20,
      ),
      titleSmall: TextStyle(
        color: SunColors.textBlack,
        fontWeight: FontWeight.w700,
        fontFamily: 'Open Sans',
        fontSize: 17,
      ),
      bodyLarge: TextStyle(
        color: SunColors.textBlack,
        fontWeight: FontWeight.w600,
        fontFamily: 'Open Sans',
        fontSize: 15,
      ),
      bodyMedium: TextStyle(
        color: SunColors.titlePurple,
        fontWeight: FontWeight.w600,
        fontFamily: 'Open Sans',
        fontSize: 15,
      ),
      bodySmall: TextStyle(
        color: SunColors.textBlack,
        fontWeight: FontWeight.w400,
        fontFamily: 'Open Sans',
        fontSize: 15,
      ),
      labelLarge: TextStyle(
        color: SunColors.titleGrey,
        fontWeight: FontWeight.w400,
        fontFamily: 'Open Sans',
        fontSize: 16,
      ),
      labelMedium: TextStyle(
        color: SunColors.titleGreyLight,
        fontWeight: FontWeight.w400,
        fontFamily: 'Open Sans',
        fontSize: 14,
      ),
      labelSmall: TextStyle(
        color: SunColors.titleGrey,
        fontWeight: FontWeight.w400,
        fontFamily: 'Open Sans',
        fontSize: 13,
      ),
    ),
  );

  static ThemeData copyWith({ThemeData? theme}) {
    return _theme.copyWith(
      colorScheme: theme?.colorScheme,
    );
  }
}
