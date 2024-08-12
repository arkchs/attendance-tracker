import 'package:attendance_tracker/constants/constants.dart';
import 'package:attendance_tracker/models/present_counter_model.dart';
import 'package:attendance_tracker/pages/HomePage/homepage.dart';
import 'package:attendance_tracker/pages/NotesPage/NotesPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider<CounterModel>(
      create: (_)=> CounterModel(),
      child: MaterialApp(
        routes: {
          '/':(context) => const HomePage(),
          'Notes':(context) => const NotesPage(),
        },
        debugShowCheckedModeBanner: false,
        theme: themeData,
      ),
    );
  }
}
