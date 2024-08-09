import 'package:attendance_tracker/pages/HomePage/Card.dart';
import 'package:attendance_tracker/models/subjects_list_model.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:attendance_tracker/models/present_counter_model.dart';
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
    final TextEditingController subName = TextEditingController();

    return Consumer<CounterModel>(
      builder: (context, model, child) => Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(235, 28, 34, 1),
          elevation: 0,
          actions: [
            addSubjectButton(context, subName),
          ],
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              ClipPath(
                clipper: ClipCustom(),
                child: Container(
                  height: size.height * 0.65,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(235, 28, 34, 1),
                    shape: BoxShape.rectangle,
                  ),
                ),
              ),
              InfoAtTop(size: size),
            ],
          ),
        ),
      ),
    );
  }

  IconButton addSubjectButton(BuildContext context, TextEditingController subName) {
    return IconButton(
            onPressed: () => {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Enter the Subject Name'),
                      actions: [
                        TextField(
                          controller: subName,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Enter the Subject Name',
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              SubjectHandlerView().addSubject(subName.text);
                              CounterModel().addSubject();
                                
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "add",
                              style: TextStyle(color: Colors.red),
                            )),
                      ],
                      elevation: 20.0,
                      backgroundColor: Colors.white,
                      shape: const ContinuousRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(12.0))),
                    );
                  }),
            },
            icon: const Icon(
              Icons.add_box_rounded,
              color: Colors.white,
            ),
          );
  }
}

class InfoAtTop extends StatelessWidget {
  const InfoAtTop({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipOval(
          child:
              Image.asset('assets/tiet_logo.jpg', height: size.height * 0.125),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: AutoSizeText(
                'Welcome, Akshat!',
                maxLines: 1,
                style: Theme.of(context)
                    .textTheme
                    .displayLarge
                    ?.copyWith(color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: AutoSizeText(
                'Here\'s all your attendance informaton!',
                maxLines: 1,
                style: Theme.of(context)
                    .textTheme
                    .displaySmall
                    ?.copyWith(color: Colors.white),
              ),
            )
          ],
        ),
        SizedBox(
          height: size.height * .22,
        ),
        Center(
          child: SizedBox(
            width: size.width * 0.9,
            height: size.height * 0.45,
            child: const CustomCard(),
          ),
        ),
      ],
    );
  }
}

class ClipCustom extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height * 0.6);
    path.quadraticBezierTo(
        size.width / 4, size.height * 0.5, size.width / 2, size.height * 0.6);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.7, size.width, size.height * 0.6);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

// class ClipCustomBottom extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     var path = Path();
//     path.moveTo(0, size.height * 0.6);
//     path.quadraticBezierTo(size.width * 0.25, size.height * 0.7, size.width / 2,
//         size.height * 0.6);
//     path.quadraticBezierTo(
//         size.width * 0.25, size.height * 0.5, 0, size.height * 0.6);
//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }



// class DescendingBezierCurve extends StatefulWidget {
//   @override
//   _DescendingBezierCurveState createState() => _DescendingBezierCurveState();
// }

// class _DescendingBezierCurveState extends State<DescendingBezierCurve> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 2), // Adjust duration as needed
//     );
//     _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
//     _controller.forward();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _animation,
//       builder: (BuildContext context, Widget? child) {
//         return CustomPaint(
//           painter: (_animation.value),
//         );
//       },
//     );
//   }
// }
