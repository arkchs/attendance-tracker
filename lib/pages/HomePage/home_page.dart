import 'package:attendance_tracker/pages/HomePage/my_list_tile.dart';
import 'package:attendance_tracker/shared/Animations/FunkyTextAnimation.dart';
import 'package:attendance_tracker/shared/Animations/MyBackDrop.dart';
import 'package:attendance_tracker/shared/bars/BottomBar.dart';
import 'package:attendance_tracker/shared/buttons/SettingsButton.dart';
import 'package:flutter/material.dart';
import 'package:attendance_tracker/models/counter_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final TextEditingController subName = new TextEditingController();
    return Consumer<CounterModel>(
      builder: (context, model, child) => Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            // title: Text(
            //   'Attendance Tracker',
            //   style: Theme.of(context)
            //       .textTheme
            //       .displaySmall
            //       ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
            // ),
            actions: [
              SettingsButton(size: size, context: context, subName: subName)
            ],
          ),
          body: Stack(
            children: [
              SingleChildScrollView(child: MyListTile(size: size)),
              MyBackDrop(size: size),
              MyTitle(
                size: size,
                subName: subName,
              ),
            ],
          ),
          bottomNavigationBar: BottomBar(size: size)),
    );
  }
}

class MyTitle extends StatelessWidget {
  const MyTitle({
    super.key,
    required this.size,
    required this.subName,
  });

  final Size size;
  final TextEditingController subName;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: size.height * 0.08,
          color: Theme.of(context).primaryColor,
        ),
        FunkyTextAnimation(),
      ],
    );
  }
}
