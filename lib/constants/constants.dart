import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData themeData = ThemeData(
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xffea1d24),
    onPrimary: Color(0xFFFFFFFF),
    secondary: Colors.purple,
    onSecondary: Colors.white,
    error: Colors.red,
    onError: Colors.white,
    background: Colors.white,
    onBackground: Color(0xffeb1c22),
    surface: Colors.grey.shade200,
    onSurface: Colors.black,
    primaryContainer: Color(0xff706677),
  ),
  textTheme: TextTheme(
    displayLarge: GoogleFonts.kanit(
      fontSize: 50.0,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: GoogleFonts.kanit(
      fontSize: 30.0,
    ),
    displaySmall: GoogleFonts.kanit(
      fontSize: 20.0,
    ),
  ),
);
