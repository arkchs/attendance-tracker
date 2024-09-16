import 'package:flutter/material.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.home_filled,
              ),
            ),
            ElevatedButton.icon(
              onPressed: () => Navigator.popAndPushNamed(context, 'Notes'),
              icon: const Icon(Icons.note_alt),
              label: Text('Notes',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}
