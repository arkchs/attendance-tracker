import 'package:attendance_tracker/models/counter_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({
    super.key,
    required this.size,
    required this.context,
    required this.subName,
  });

  final Size size;
  final BuildContext context;
  final TextEditingController subName;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return Animate(
                effects: [
                  FadeEffect(duration: const Duration(milliseconds: 250)),
                  // ScaleEffect(duration: const Duration(milliseconds: 500))
                ],
                child: AlertDialog(
                  title: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      'Add a Subject',
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                    ),
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: TextField(
                        controller: subName,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter the Subject Name',
                          fillColor: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        onPressed: () {
                          context.read<CounterModel>().addSubject(subName.text);
                          Navigator.pop(context);
                        },
                        child: Text("add",
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground)),
                      ),
                    ),
                  ],
                  elevation: 20.0,
                  backgroundColor: Colors.white,
                  shape: const ContinuousRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0))),
                ),
              );
            }),
      },
      icon: ClipOval(
          child: Image.asset('assets/tiet_logo.jpg',
              fit: BoxFit.fill, width: 45.0, height: 50.0)),
    );
  }
}
