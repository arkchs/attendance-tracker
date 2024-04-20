import 'package:flutter/material.dart';
class CustomCard extends StatefulWidget {
  const CustomCard({super.key});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  List<String> subjects = [
    'Optimization Techniques',
    'Artificial Intelligence',
    'Computer Networks',
    'Database Mangament Systems',
    'Design and Analysis of Algorithms',
    'Software Engineering',
  ];
  List<IconData> icons = [
    Icons.calculate,
    Icons.smart_toy,
    Icons.wifi,
    Icons.density_small_sharp,
    Icons.calculate,
    Icons.delete,
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: subjects.length,
        itemBuilder: (context, index) {
          return Card(
            color: Color.fromRGBO(255, 254, 251,1),
            child: ListTile(
              title: Text(subjects[index]),
              subtitle: Text('Present/Total'),
              leading: Icon(icons[index]),
              trailing: Icon(Icons.arrow_forward),
            ),
          );
        });
  }
}
