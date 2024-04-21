import 'package:attendance_tracker/constants/constants.dart';
import 'package:attendance_tracker/subjectPage.dart/subjects_page.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({super.key});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: subjects.length,
        itemBuilder: (context, index) {
          return Card(
            color: Color.fromRGBO(255, 254, 251, 1),
            child: ListTile(
              onTap: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            subjectsPage(title: subjects[index])))
              },
              title: Text(subjects[index]),
              subtitle: Text('Present/Total'),
              leading: Icon(icons[index]),
              trailing: Icon(Icons.arrow_forward),
            ),
          );
        });
  }
}
