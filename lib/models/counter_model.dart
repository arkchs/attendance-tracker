import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterModel with ChangeNotifier {
  List<String> subjects = [
    "Machine Learning",
    "Network Programming",
    "Cloud Computing",
    "Convo AI",
    "EDS",
    "Probability and Statistics"
  ];

  List<int> present = [0, 0, 0, 0, 0, 0];
  List<int> total = [0, 0, 0, 0, 0, 0];
  List<String> text = ['', '', '', '', '', ''];
  List<bool> showPercent = [true, true, true, true, true, true];
  late SharedPreferences prefs;
  CounterModel() {
    initPrefs();
  }

  Future<void> initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    for (int i = 0; i < present.length; i++) {
      present[i] = prefs.getInt("present$i") ?? 0;
      total[i] = prefs.getInt("total$i") ?? 0;
      text[i] = prefs.getString("text$i") ?? '';
    }
    notifyListeners();
  }

  void showPercentFunc(int index) async {
    text[index] = (present[index] / total[index] * 100).toStringAsFixed(2);
    showPercent[index] = false;
    await prefs.setString("text$index", text[index]);
    notifyListeners();
  }

  void showValueFunc(int index) {
    text[index] = present[index].toString();
    showPercent[index] = true;
    notifyListeners();
  }

  void incPresent(int index) async {
    present[index]++;
    decPresent(index);
    showPercentFunc(index);
    await prefs.setInt("present$index", present[index]);
    notifyListeners();
  }

  void decPresent(int index) async {
    total[index]++;
    showPercentFunc(index);
    await prefs.setInt("total$index", total[index]);
    notifyListeners();
  }

  void addSubject(String subjectName) {
    subjects.add(subjectName);
    notifyListeners();
    present.add(0);
    total.add(0);
    showPercent.add(true);
    text.add('');
    notifyListeners();
  }

  void deleteSubject(int index) {
    subjects.removeAt(index);
    present.removeAt(index);
    total.removeAt(index);
    showPercent.removeAt(index);
    text.removeAt(index);
    notifyListeners();
  }

  void editSubject(int index, String subjectName) {
    subjects[index] = subjectName;
    notifyListeners();
  }
}
