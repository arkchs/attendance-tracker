import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';


class SubjectPage extends StatefulWidget {
  // final List<String> subjects;
  const SubjectPage({/*required this.subjects*/super.key});

  @override
  State<SubjectPage> createState() => _SubjectPageState();
}

class _SubjectPageState extends State<SubjectPage> {
  @override
  Widget build(BuildContext context) {
    double present=5;
    double absent=5;
    Map<String,double> data={
      "Absent": absent,
      "Present": present,
    };
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



          Expanded(child: SizedBox(
            //USE AWESOME CIRCULAR CHAR INSTEAD
            child: PieChart(dataMap: data, chartType: ChartType.ring,
            chartRadius: MediaQuery.of(context).size.width*0.4,
            ringStrokeWidth: 10,
            legendOptions: LegendOptions(
              showLegends: false,
            ),)
          )),





          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: FloatingActionButton(
                    onPressed: () => {},
                    backgroundColor: Colors.red,
                    child: Text('Absent -',style: Theme.of(context).textTheme.displaySmall,),
                  ),
                ),
                Expanded(
                  child: FloatingActionButton(
                    onPressed: () => {},
                    backgroundColor: Colors.green,
                    child: Text('Present +',style: Theme.of(context).textTheme.displaySmall,),
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