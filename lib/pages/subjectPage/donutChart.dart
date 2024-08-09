import 'package:attendance_tracker/models/present_counter_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DonutChart extends StatefulWidget {
  const DonutChart({super.key, required this.index});
  final int index;

  @override
  State<DonutChart> createState() => _DonutChartState();
}

class _DonutChartState extends State<DonutChart> {
  void updateValues(
      List<String> text, List<int> present, List<int> total) async {
    var prefs = await SharedPreferences.getInstance();
    for (int i = 0; i < present.length; i++) {
      present[i] = prefs.getInt("present$i") ?? 0;
      total[i] = prefs.getInt("total$i") ?? 0;
      text[i] = prefs.getString("text$i") ?? '';
    }
    setState(() => {});
  }

  @override
  Widget build(BuildContext context) {
    List<String> text = context.watch<CounterModel>().text;
    List<int> present = context.watch<CounterModel>().present;
    List<int> total = context.watch<CounterModel>().total;
    updateValues(text, present, total);
    Size size = MediaQuery.of(context).size;

    return Consumer<CounterModel>(
      builder: (context, model, child) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 250,
            child: Stack(
              children: [
                PieChart(
                  PieChartData(
                    startDegreeOffset: 250,
                    sectionsSpace: 0,
                    centerSpaceRadius: 100,
                    sections: [
                      PieChartSectionData(
                        value: model.present[widget.index].toDouble(),
                        color: Colors.greenAccent,
                        radius: 30,
                        showTitle: false,
                      ),
                      PieChartSectionData(
                        value: (model.total[widget.index] -
                                model.present[widget.index])
                            .toDouble(),
                        color: Colors.blue.shade900,
                        radius: 25,
                        showTitle: false,
                      ),
                    ],
                  ),
                ),
                Center(
                  child: TextButton(
                      onPressed: () => {
                            model.showPercent[widget.index]
                                ? model.showPercentFunc(widget.index)
                                : model.showValueFunc(widget.index)
                          },
                      child: Text(model.text[widget.index],
                          style: const TextStyle(fontSize: 30))),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              presentButton(model),
              SizedBox(width: size.width * 0.3),
              absentButtton(model),
            ],
          ),
        ],
      ),
    );
  }

  Widget presentButton(model) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.greenAccent),
      ),
      onPressed: () {
        model.incPresent(widget.index);
      },
      child: const Text(
        'Present',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }

  Widget absentButtton(model) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.blue.shade900),
      ),
      onPressed: () {
        model.decPresent(widget.index);
      },
      child: const Text(
        'Absent',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
