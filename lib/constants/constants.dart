import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData themeData = ThemeData(
    primaryColor: Colors.purple,
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

 List<String> subjects = [
    'Optimization Techniques',
    'Artificial Intelligence',
    'Computer Networks',
    'Database Mangament Systems',
    'Design and Analysis of Algorithms',
    'Software Engineering',
  ];
  List<IconData> icons = [
    Icons.calculate,
    Icons.smart_toy,
    Icons.wifi,
    Icons.density_small_sharp,
    Icons.calculate,
    Icons.delete,
  ];