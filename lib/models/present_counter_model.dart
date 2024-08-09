import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterModel with ChangeNotifier {
  List<int> present = [0, 0, 0, 0, 0, 0];
  List<int> total = [0, 0, 0, 0, 0, 0];
  List<String> text = ['', '', '', '', '', ''];
  List<bool> showPercent = [true, true, true, true, true, true];
  late SharedPreferences prefs;
  CounterModel() {
    _initPrefs();
  }

  Future<void> _initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  void showPercentFunc(int index) async {
    text[index] = (present[index] / total[index] * 100).toStringAsFixed(2);
    showPercent[index] = false;
    bool isSaved = await prefs.setString("text${index}", text[index]);
    print(isSaved.toString());
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
    await prefs.setInt("present${index}", present[index]);
    notifyListeners();
  }

  void decPresent(int index) async {
    total[index]++;
    showPercentFunc(index);
    await prefs.setInt("total${index}", total[index]);
    notifyListeners();
  }

  void addSubject() {
    present.add(0);
    total.add(0);
    showPercent.add(true);
    text.add('');
    notifyListeners();
  }
}
