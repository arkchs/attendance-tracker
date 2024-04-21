import 'package:attendance_tracker/subjectPage/DonutChart.dart';
import 'package:flutter/material.dart';

class subjectsPage extends StatefulWidget {
  const subjectsPage({super.key,required this.title});
  final String title;
  @override
  State<subjectsPage> createState() => _subjectsPageState();
}

class _subjectsPageState extends State<subjectsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title)
      ),
      body: DonutChart(),
    );
  }
}