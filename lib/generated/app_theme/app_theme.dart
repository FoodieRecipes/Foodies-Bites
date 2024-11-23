import 'package:flutter/material.dart';

class AppColors {
  static const primaryRed = Color(0xFFF55A51);
  static const primaryGreen = Color(0xFF034904); 
}

class CustomTheme {
  static ThemeData get lightTheme {
    return _lightTheme;
  }
static ThemeData get darkTheme {
    return _darkTheme;
  }

  static final ThemeData _lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryGreen, brightness: Brightness.light),
    fontFamily: "Manrope",
    scaffoldBackgroundColor: Colors.white,
    primaryColor: AppColors.primaryGreen, 
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all<Color>(
        AppColors.primaryGreen,
      ),
    )),
    expansionTileTheme: const ExpansionTileThemeData(
        shape: Border(), backgroundColor: Colors.white),
  );

  static final ThemeData _darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryGreen, brightness: Brightness.dark),
    fontFamily: "Manrope",
    primaryColorLight: Colors.green,
    scaffoldBackgroundColor: Colors.black,
    primaryColor: Colors.black, 
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all<Color>(
        Colors.black,
      ),
    )),
    expansionTileTheme: const ExpansionTileThemeData(
        shape: Border(), backgroundColor: Colors.black),
  );
} 