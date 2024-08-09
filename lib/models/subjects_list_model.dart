import 'package:flutter/material.dart';

List<String> subjects = [
  "Machine Learning",
  "Network Programming",
  "Cloud Computing",
  "Convo AI",
  "Employment Development Skills",
  "Probability and Statistics"
];

class SubjectHandlerView with ChangeNotifier {
  void addSubject(String subjectName) {
    subjects.add(subjectName);
  }
}
