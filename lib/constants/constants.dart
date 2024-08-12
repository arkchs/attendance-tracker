import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData themeData = ThemeData(
    primaryColor: const Color.fromRGBO(235, 28, 34,1),
    textTheme: TextTheme(
      labelMedium: GoogleFonts.notoSans(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
      displayLarge: const TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      displaySmall: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20, 
          )
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
      ),
    ));

