import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  static ThemeData lightThemeData = themeData();

  static ThemeData themeData() {
    final base = ThemeData.light();
    return base.copyWith(
        textTheme: _buildTextTheme(base.textTheme),
        colorScheme: ColorScheme(
            brightness: Brightness.light,
            primary: const Color.fromARGB(255, 64, 95, 135),
            onPrimary: Colors.white,
            primaryContainer: Colors.white,
            onPrimaryContainer: const Color.fromARGB(255, 64, 95, 135),
            secondary: const Color.fromARGB(250, 254, 190, 73),
            onSecondary: Colors.white,
            error: Colors.red.shade400,
            onError: Colors.red.shade200,
            background: Colors.white,
            onBackground: Colors.white,
            surface: Colors.white,
            onSurface: const Color.fromARGB(255, 64, 95, 135)));
  }

  static TextTheme _buildTextTheme(TextTheme base) {
    return base.copyWith(
      headlineLarge: GoogleFonts.jua(textStyle: base.headlineLarge),
      headlineMedium: GoogleFonts.jua(textStyle: base.headlineMedium),
      headlineSmall: GoogleFonts.jua(textStyle: base.headlineSmall),
      titleLarge: GoogleFonts.blackHanSans(textStyle: base.titleLarge),
      titleMedium: GoogleFonts.blackHanSans(textStyle: base.titleMedium),
      titleSmall: GoogleFonts.blackHanSans(textStyle: base.titleSmall),
      bodyLarge: GoogleFonts.jua(textStyle: base.bodyLarge),
      bodyMedium: GoogleFonts.jua(textStyle: base.bodyMedium),
      bodySmall: GoogleFonts.jua(textStyle: base.bodySmall),
      labelLarge: GoogleFonts.jua(textStyle: base.labelLarge),
      labelMedium: GoogleFonts.jua(textStyle: base.labelMedium),
      labelSmall: GoogleFonts.jua(textStyle: base.labelSmall),
    );
  }
}
