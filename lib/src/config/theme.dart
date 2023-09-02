import 'package:flutter/material.dart';

class AppTheme {
  static Color primaryColor = Colors.blue;
  static ColorScheme darkScheme = ColorScheme.dark(
    primary: primaryColor,
  );

  static ThemeData light = ThemeData.light(useMaterial3: true).copyWith(
    colorScheme: ColorScheme.light(
      primary: primaryColor,
    ),
  );

  static ThemeData darkTheme = ThemeData.dark(useMaterial3: true).copyWith(
    colorScheme: darkScheme,
  );

  static ThemeData lightTheme = ThemeData.light().copyWith(
    colorScheme: ColorScheme.light(
      primary: primaryColor,
    ),
  );
}
