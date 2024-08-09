import 'package:flutter/material.dart';

List<String> subjects = [
  'Optimization Techniques',
  'Artificial Intelligence',
  'Computer Networks',
  'Database Mangament Systems',
  'Design and Analysis of Algorithms',
  'Software Engineering',
];

class SubjectHandlerView with ChangeNotifier {
  void addSubject(String subjectName) {
    subjects.add(subjectName);
  }
}
