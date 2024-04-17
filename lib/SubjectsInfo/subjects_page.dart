import 'package:flutter/material.dart';
import 'package:awesome_circular_chart/awesome_circular_chart.dart';

class SubjectPage extends StatefulWidget {
  // final List<String> subjects;
  const SubjectPage({/*required this.subjects*/ super.key});

  @override
  State<SubjectPage> createState() => _SubjectPageState();
}

class _SubjectPageState extends State<SubjectPage> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<AnimatedCircularChartState> _chartKey =
        new GlobalKey<AnimatedCircularChartState>();
    List<CircularStackEntry> data = <CircularStackEntry>[
      new CircularStackEntry(
        <CircularSegmentEntry>[
          new CircularSegmentEntry(500.0, Colors.red[200], rankKey: 'Absent'),
          new CircularSegmentEntry(1000.0, Colors.green[200], rankKey: 'Present'),
        ],
        rankKey: 'Attendance Ranks',
      ),
    ];
    setState(() {
      // _chartKey.currentState?.updateData();
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Text(
            'Opti Tech',
            style: Theme.of(context)
                .textTheme
                .displayLarge
                ?.copyWith(color: Colors.black),
          ),

          // Expanded(child: SizedBox(
          //   //USE AWESOME CIRCULAR CHAR INSTEAD
          //   child: PieChart(dataMap: data, chartType: ChartType.ring,
          //   chartRadius: MediaQuery.of(context).size.width*0.4,
          //   ringStrokeWidth: 10,
          //   legendOptions: LegendOptions(
          //     showLegends: false,
          //   ),)
          // )),

          Expanded(
            child: SizedBox(
              child: AnimatedCircularChart(
                key: _chartKey,
                size: Size(500,500),
                initialChartData: data,
                chartType: CircularChartType.Radial,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: FloatingActionButton(
                    onPressed: () => {},
                    backgroundColor: Colors.red,
                    child: Text(
                      'Absent -',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ),
                ),
                Expanded(
                  child: FloatingActionButton(
                    onPressed: () => {},
                    backgroundColor: Colors.green,
                    child: Text(
                      'Present +',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
