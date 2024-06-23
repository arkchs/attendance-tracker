import 'package:attendance_tracker/HomePage/Card.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(235, 28, 34, 1),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            ClipPath(
              clipper: ClipCustomBottom(),
              child: Container(
                height: size.height * 0.75,
                decoration: const BoxDecoration(
                  color: Colors.amber,
                  shape: BoxShape.rectangle,
                ),
              ),
            ),
            ClipPath(
              clipper: ClipCustom(),
              child: Container(
                height: size.height * 0.75,
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
          child: Image.asset('assets/tiet_logo.jpg',
              height: size.height * 0.125),
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
              padding: const EdgeInsets.only(left: 20),
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
          height: size.height * .3,
        ),
        Center(
          child: SizedBox(
            width: size.width*0.9,
            height: size.height * 0.4,
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

class ClipCustomBottom extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, size.height * 0.6);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.7, size.width / 2,
        size.height * 0.6);
    path.quadraticBezierTo(
        size.width * 0.25, size.height * 0.5, 0, size.height * 0.6);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
