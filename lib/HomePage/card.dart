import 'package:attendance_tracker/constants/constants.dart';
import 'package:attendance_tracker/models/present_counter_model.dart';
import 'package:attendance_tracker/subjectPage/subjects_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({super.key});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
        itemCount: subjects.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.blue,
            child: ListTile(
              onTap: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SubjectsPage(title: subjects[index], index: index)))
              },
              title: Text(subjects[index],
                  style: TextStyle(
                      fontSize: size.height * 0.05, color: Colors.white)),
              subtitle: Consumer<CounterModel>(
                  builder: (context, model, child) => Text(
                      '${model.present[index]}/${model.total[index]}',
                      style: TextStyle(
                          fontSize: size.height * 0.05,
                          color: Colors.white))),
              leading: Icon(
                icons[index],
                size: 50,
                color: Colors.white,
              ),
            ),
          );
        });
  }
}
