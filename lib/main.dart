import 'package:attendance_tracker/SubjectsInfo/subjects_page.dart';
import 'package:flutter/material.dart';
import 'HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => HomePage(),
        'SubjectPage': (context) => SubjectPage(),
      },
      theme: ThemeData(
        textTheme: TextTheme(
          displayLarge: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          displaySmall: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20, 
          )
        ),
      ),
    );
  }
}
