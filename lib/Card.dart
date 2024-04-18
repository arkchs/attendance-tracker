import 'package:flutter/material.dart';
import 'package:awesome_circular_chart/awesome_circular_chart.dart';

class CustomCard extends StatefulWidget {
  CustomCard({super.key});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  List<String> s = [
    'Optimization Techniques',
    'Artificial Intelligence',
    'Design and Analysis Of Algorithms',
    'DataBase Management Systems',
    'Computer Networks',
    'Software Engineering',
  ];

       final List<GlobalKey<AnimatedCircularChartState>> _chartKey =
         [GlobalKey<AnimatedCircularChartState>(),GlobalKey<AnimatedCircularChartState>(),
         GlobalKey<AnimatedCircularChartState>(),GlobalKey<AnimatedCircularChartState>(),
         GlobalKey<AnimatedCircularChartState>(),GlobalKey<AnimatedCircularChartState>()];
    List<CircularStackEntry> data = <CircularStackEntry>[
        const CircularStackEntry(
        <CircularSegmentEntry>[
           CircularSegmentEntry(0.0, Colors.amber, rankKey: 'Absent'),
           CircularSegmentEntry(65, Colors.green, rankKey: 'Total'),
        ],
        rankKey: 'Attendance Ranks',
      ),


      /*The only change to be made further is to make individual lists of the following data to enable it to
      be mapped to a different widget in the listView.builder entry*/




      //  CircularStackEntry(
      //   <CircularSegmentEntry>[
      //      CircularSegmentEntry(500, Colors.amber, rankKey: 'Absent'),
      //      CircularSegmentEntry(1000.0, Colors.green, rankKey: 'Present'),
      //   ],
      //   rankKey: 'Attendance Ranks',
      // ),
      //  CircularStackEntry(
      //   <CircularSegmentEntry>[
      //      CircularSegmentEntry(500, Colors.amber, rankKey: 'Absent'),
      //      CircularSegmentEntry(1000.0, Colors.green, rankKey: 'Present'),
      //   ],
      //   rankKey: 'Attendance Ranks',
      // ),
      //  CircularStackEntry(
      //   <CircularSegmentEntry>[
      //      CircularSegmentEntry(500.0, Colors.amber, rankKey: 'Absent'),
      //      CircularSegmentEntry(1000.0, Colors.green, rankKey: 'Present'),
      //   ],
      //   rankKey: 'Attendance Ranks',
      // ),
      //  CircularStackEntry(
      //   <CircularSegmentEntry>[
      //      CircularSegmentEntry(500.0, Colors.amber, rankKey: 'Absent'),
      //      CircularSegmentEntry(1000.0, Colors.green, rankKey: 'Present'),
      //   ],
      //   rankKey: 'Attendance Ranks',
      // ),
      //  CircularStackEntry(
      //   <CircularSegmentEntry>[
      //      CircularSegmentEntry(500.0, Colors.amber, rankKey: 'Absent'),
      //      CircularSegmentEntry(1000.0, Colors.green, rankKey: 'Present'),
      //   ],
      //   rankKey: 'Attendance Ranks',
      // ),
    ];


  @override
  Widget build(BuildContext context) {
    void _decrement(int index)
    {
      var absent_value=data[index].entries[0].value+1;
      data[index]=CircularStackEntry(
        <CircularSegmentEntry>[
           CircularSegmentEntry(absent_value, Colors.amber, rankKey: 'Absent'),
           CircularSegmentEntry(65, Colors.green, rankKey: 'Total'),
        ],
        rankKey: 'Attendance Ranks',
      );
      setState(() {
        _chartKey[index].currentState?.updateData(data);
      });
    }
    Size Screen = MediaQuery.of(context).size;
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: s.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius:BorderRadius.circular(50) ),
            elevation: 5,  
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  // decoration: BoxDecoration(
                  //   gradient: LinearGradient(
                  //     colors: [
                  //       Colors.white,
                  //       Colors.amber.shade100,
                  //     ],
                  //     begin: Alignment.topLeft,
                  //     end: Alignment.bottomRight,
                  //   ),
                  // ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 25),
                    child: Text(
                      s[index],
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: 170,
                  child: Center(
                    child: AnimatedCircularChart(
                      key: _chartKey[index],
                      size: Size(180,180),
                      initialChartData: data,
                      chartType: CircularChartType.Radial,
                    ),
                  ),
                ),
                Row(
                  children: [
                    IconButton.filled(onPressed: () => {setState(() => _decrement(index))}, style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.amber)), icon: Icon(Icons.arrow_downward_rounded), color: Colors.white, iconSize: 40,),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
