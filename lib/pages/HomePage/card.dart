import 'package:attendance_tracker/models/present_counter_model.dart';
import 'package:attendance_tracker/pages/subjectPage/subjects_page.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SubjectListModel extends ChangeNotifier {}

class CustomCard extends StatefulWidget {
  const CustomCard({super.key});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<String> subjects = context.watch<CounterModel>().subjects;
    return Consumer<CounterModel>(
      builder: (context, value, child) => ListView.builder(
          itemCount: subjects.length,
          itemBuilder: (context, index) {
            return Card(
              color: Theme.of(context).primaryColor,
              child: ListTile(
                onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SubjectsPage(
                              title: value.subjects[index], index: index)))
                },
                title: AutoSizeText(subjects[index],
                    style: TextStyle(
                      fontSize: size.height * 0.03,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                    ),
                subtitle: Text(
                    ((value.present[index] / value.total[index]) * 100)
                        .toStringAsFixed(2),
                    style: TextStyle(
                        fontSize: size.height * 0.02, color: Colors.white)),
                trailing: IconButton(
                  onPressed: () {
                    context.read<CounterModel>().deleteSubject(index);
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
