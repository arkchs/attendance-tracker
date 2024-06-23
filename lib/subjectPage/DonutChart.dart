import 'package:attendance_tracker/models/present_counter_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DonutChart extends StatelessWidget {
  const DonutChart({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    
    Size size = MediaQuery.of(context).size;
    
    return Consumer<CounterModel>(
      builder: (context, model, child) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => {
              model.showPercent[index] ? model.showPercentFunc(index) : model.showValueFunc(index),
            },
            child: SizedBox(
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
                          value: model.present[index].toDouble(),
                          color: Colors.greenAccent,
                          radius: 30,
                          showTitle: false,
                        ),
                        PieChartSectionData(
                          value: (model.total[index] - model.present[index]).toDouble(),
                          color: Colors.blue.shade900,
                          radius: 25,
                          showTitle: false,
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: TextButton(
                        onPressed: () =>
                            {model.showPercent[index] ? model.showPercentFunc(index) : model.showValueFunc(index)},
                        child: Text(model.text[index], style: const TextStyle(fontSize: 30))),
                  )
                ],
              ),
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
      onPressed: () {model.incPresent(index);},
      child: const Text('Present', style: TextStyle(color: Colors.white, fontSize: 20),),
    );
  }

  Widget absentButtton(model) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.blue.shade900),
      ),
      onPressed: () {model.decPresent(index);},
      child: const Text('Absent',style: TextStyle(color: Colors.white ,fontSize: 20),),
    );
  }
}
