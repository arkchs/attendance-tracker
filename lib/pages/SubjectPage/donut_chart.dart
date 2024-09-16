import 'package:attendance_tracker/models/counter_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DonutChart extends StatefulWidget {
  const DonutChart({super.key, required this.index});
  final int index;

  @override
  State<DonutChart> createState() => _DonutChartState();
}

class _DonutChartState extends State<DonutChart> {
  void updateValues() async {
    CounterModel().initPrefs();
    setState(() => {});
  }

  @override
  Widget build(BuildContext context) {
    updateValues();
    Size size = MediaQuery.of(context).size;

    return Consumer<CounterModel>(
      builder: (context, model, child) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 250,
            width: 250,
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
                        color: Colors.blue,
                        radius: 30,
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
                          style: TextStyle(
                              fontSize: 30,
                              color: Theme.of(context).colorScheme.secondary))),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: presentButton(model),
              ),
              SizedBox(width: size.width * 0.2),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: absentButtton(model),
              ),
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
        style: TextStyle(color: Colors.white, fontSize: 10),
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
        style: TextStyle(color: Colors.white, fontSize: 10),
      ),
    );
  }
}
