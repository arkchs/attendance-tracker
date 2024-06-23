import 'package:flutter/material.dart';

class CounterModel with ChangeNotifier {
  List<int> present=[0,0,0,0,0,0];
  List<int> total=[0,0,0,0,0,0];
  List<String> text=['','','','','',''];
  List<bool> showPercent=[true,true,true,true,true,true];
  CounterModel();

  void showPercentFunc(int index) {
    text[index] = (present[index] / total[index] * 100).toStringAsFixed(2);
    showPercent[index] = false;
    notifyListeners();
  }

  void showValueFunc(int index) {
    text[index] = present[index].toString();
    showPercent[index] = true;
    notifyListeners();
  }

  void incPresent(int index) {
    present[index]++;
    total[index]++;
    notifyListeners();
  }

  void decPresent(int index) {
    total[index]++;
    notifyListeners();
  }
}



