import 'package:attendance_tracker/subjectPage/donutChart.dart';
import 'package:flutter/material.dart';

class SubjectsPage extends StatefulWidget {
  const SubjectsPage({super.key, required this.title, required this.index});
  final String title;
  final int index;
  @override
  State<SubjectsPage> createState() => _SubjectsPageState();
}

class _SubjectsPageState extends State<SubjectsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: DonutChart(index: widget.index),
    );
  }
}
