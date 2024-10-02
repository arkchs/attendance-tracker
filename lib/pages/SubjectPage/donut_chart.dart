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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
            width: 50,
            child: Stack(
              children: [
                PieChart(
                  PieChartData(
                    startDegreeOffset: 250,
                    sectionsSpace: 0,
                    centerSpaceRadius: 50,
                    sections: [
                      PieChartSectionData(
                        value: model.present[widget.index].toDouble(),
                        color: Colors.red.shade900,
                        radius: 20,
                        showTitle: false,
                      ),
                      PieChartSectionData(
                        value: (model.total[widget.index] -
                                model.present[widget.index])
                            .toDouble(),
                        color: Colors.white,
                        radius: 15,
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
                          style: TextStyle(fontSize: 20, color: Colors.white))),
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
                child: absentButton(model),
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
        backgroundColor: MaterialStateProperty.all(Colors.red.shade900),
      ),
      onPressed: () {
        model.incPresent(widget.index);
      },
      child: Text(
        'Present',
        style: TextStyle(color: Colors.white, fontSize: 10),
      ),
    );
  }

  Widget absentButton(model) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white),
      ),
      onPressed: () {
        model.decPresent(widget.index);
      },
      child: const Text(
        'Absent',
        style: TextStyle(color: Colors.black, fontSize: 10),
      ),
    );
  }
}
