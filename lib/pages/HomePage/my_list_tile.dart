import 'package:attendance_tracker/models/counter_model.dart';
import 'package:attendance_tracker/pages/SubjectPage/donut_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:popover/popover.dart';
import 'package:provider/provider.dart';

class MyListTile extends StatefulWidget {
  final Size size;
  const MyListTile({super.key, required this.size});

  State<MyListTile> createState() => _MyListTileState();
}

class _MyListTileState extends State<MyListTile> {
  @override
  Widget build(BuildContext context) {
    List<String> subjects = context.watch<CounterModel>().subjects;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          height: widget.size.height * 0.47,
        ),
        Center(
          child: Container(
            width: widget.size.width * 0.95,
            height: widget.size.height * 0.44 + 12,
            child: Consumer<CounterModel>(
              builder: (context, value, child) => ListView.builder(
                  itemCount: subjects.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomContainer(
                        size: widget.size,
                        context: context,
                        subjects: subjects,
                        index: index,
                        value: value,
                      ),
                    );
                  }),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomContainer extends StatefulWidget {
  final Size size;
  final BuildContext context;
  final List<String> subjects;
  final int index;
  final CounterModel value;
  const CustomContainer(
      {super.key,
      required this.size,
      required this.context,
      required this.subjects,
      required this.index,
      required this.value});
  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: 10.seconds,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastEaseInToSlowEaseOut,
  );
  double _height = 0.10;
  bool isList = false;
  bool isListCompleted = false;

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _height = _height == 0.6 ? 0.10 : 0.6;
          isList = !isList;
          isListCompleted = !isListCompleted;
        });
      },
      child: SizeTransition(
        sizeFactor: _animation,
        axis: Axis.horizontal,
        axisAlignment: -1,
        child: Container(
          width: widget.size.width * 0.95,
          height: widget.size.height * _height,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ListInfo(context),
              isListCompleted
                  ? Card(
                          elevation: 0,
                          margin: const EdgeInsets.all(16.0),
                          color: Theme.of(context).colorScheme.primary,
                          child: DonutChart(index: widget.index))
                      .animate(effects: [ScaleEffect()])
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  Expanded ListInfo(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 35.0,
                width: 40.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
            child: SizedBox(
              width: widget.size.width * 0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.subjects[widget.index],
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          overflow: TextOverflow.ellipsis,
                          color: Theme.of(context).colorScheme.onPrimary)),
                  ((widget.value.present[widget.index] /
                                  widget.value.total[widget.index]) *
                              100)
                          .isNaN
                      ? Text(
                          '...',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                        )
                      : Text(
                          ((widget.value.present[widget.index] /
                                      widget.value.total[widget.index]) *
                                  100)
                              .toStringAsFixed(2),
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                        ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Builder(builder: (context) {
              return IconButton(
                onPressed: () => showPopover(
                  transitionDuration: 200.ms,
                  context: context,
                  bodyBuilder: (context) => MyPopOptions(
                    index: widget.index,
                  ),
                ),
                icon: Icon(
                  Icons.more_vert,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  const MyClipper();
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.8);
    path.quadraticBezierTo(0, size.height, size.width * 0.2, size.height);
    path.lineTo(size.width * 0.8, size.height);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height * 0.8);
    path.lineTo(size.width, size.height * 0.2);
    path.quadraticBezierTo(size.width, 0, size.width * 0.8, 0);
    path.lineTo(size.width * 0.2, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class MyPopOptions extends StatelessWidget {
  final int index;
  const MyPopOptions({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: Text('Edit Subject'),
                        content: TextField(
                          controller: TextEditingController(
                              text:
                                  context.read<CounterModel>().subjects[index]),
                          onChanged: (value) {
                            context
                                .read<CounterModel>()
                                .editSubject(index, value);
                          },
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                              child: Text('Cancel')),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                              child: Text('Save')),
                        ],
                      ));
            },
            child: Text('Edit')),
        TextButton(
            onPressed: () {
              context.read<CounterModel>().deleteSubject(index);
              Navigator.pop(context);
            },
            child: Text('Delete')),
      ],
    );
  }
}
