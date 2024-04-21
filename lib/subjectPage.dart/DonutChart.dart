import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DonutChart extends StatefulWidget {
  DonutChart({super.key});
  @override
  _DonutChartState createState() => _DonutChartState();
}

class _DonutChartState extends State<DonutChart> {
  int present = 75;
  int total = 100;
  double text = 0;
  bool showPercent = true;
  void showPercentFunc() {
    setState(() {
      text = present / total * 100;
      showPercent = false;
    });
  }

  void showValueFunc() {
    setState(() {
      text = present.toDouble();
      showPercent = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    text = present / total * 100;
    showPercent = true;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => {
              showPercent ? showPercentFunc() : showValueFunc(),
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
                          value: present.toDouble(),
                          color: Colors.greenAccent,
                          radius: 30,
                          showTitle: false,
                        ),
                        PieChartSectionData(
                          value: (total - present).toDouble(),
                          color: Colors.blue.shade900,
                          radius: 25,
                          showTitle: false,
                        ),
                        // PieChartSectionData(
                        //   value: 20,
                        //   color: Colors.grey.shade400,
                        //   radius: 20,
                        //   showTitle: false,
                        // ),
                      ],
                    ),
                  ),
                  Center(
                    child: TextButton(
                        onPressed: () =>
                            {showPercent ? showPercentFunc() : showValueFunc()},
                        child:
                             Text('constant', style: TextStyle(fontSize: 30))),
                  )
                  // Positioned.fill(
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Container(
                  //         height: 160,
                  //         width: 160,
                  //         decoration: BoxDecoration(
                  //           color: Colors.white,
                  //           shape: BoxShape.circle,
                  //           boxShadow: [
                  //             BoxShadow(
                  //               color: Colors.grey.shade200,
                  //               blurRadius: 10.0,
                  //               spreadRadius: 10.0,
                  //               offset: const Offset(3.0, 3.0),
                  //             ),
                  //           ],
                  //         ),
                  //         child: Center(
                  //           child: Text(
                  //             '$text %',
                  //             style: TextStyle(fontSize: 20),
                  //           ),
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
