import 'package:attendance_tracker/models/present_counter_model.dart';
import 'package:attendance_tracker/pages/subjectPage/subjects_page.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:attendance_tracker/models/subjects_list_model.dart';

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
            color: Theme.of(context).primaryColor,
            child: ListTile(
              onTap: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SubjectsPage(title: subjects[index], index: index)))
              },
              title: AutoSizeText(subjects[index],
                  style: TextStyle(
                      fontSize: size.height * 0.03,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,),
                  maxLines: 1),
              subtitle: Consumer<CounterModel>(
                  builder: (context, model, child) => Text(
                      '${((model.present[index]/model.total[index])*100).toStringAsFixed(2)}',
                      style: TextStyle(
                          fontSize: size.height * 0.02, color: Colors.white))),
            ),
          );
        });
  }
}
