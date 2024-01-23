import 'package:flutter/material.dart';
import 'package:attendance_tracker/HomePage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      elevation: 10,
      title: Text(
        'Attendance Tracker',
        style: TextStyle(color: Colors.black, fontSize: 30),
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.elliptical(25, 5),
              bottomRight: Radius.elliptical(25, 5))),
      centerTitle: true,
    ));
  }
}
