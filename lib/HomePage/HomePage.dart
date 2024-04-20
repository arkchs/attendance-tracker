import 'package:attendance_tracker/app_state.dart';
import 'package:attendance_tracker/HomePage/card.dart';
import 'package:attendance_tracker/src/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    Size ScreenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(235, 28, 34,1),
        elevation: 0,
        actions: [
          Consumer<ApplicationState>(
            builder: (context, appState, _) => AuthFunc(
                isAuthenticated: appState.isAuthenticated,
                signOut: () {
                  FirebaseAuth.instance.signOut();
                }),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            ClipPath(
              clipper: ClipCustomBottom(),
              child: Container(
                height: ScreenSize.height * 0.75,
                decoration: const BoxDecoration(
                  color: Colors.amber,
                  shape: BoxShape.rectangle,
                ),
              ),
            ),
            ClipPath(
              clipper: ClipCustom(),
              child: Container(
                height: ScreenSize.height * 0.75,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(235, 28, 34,1),
                  shape: BoxShape.rectangle,
                ),
              ),
            ),
            infoAtTop(ScreenSize: ScreenSize),
          ],
        ),
      ),
    );
  }
}

class infoAtTop extends StatelessWidget {
  const infoAtTop({
    super.key,
    required this.ScreenSize,
  });

  final Size ScreenSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipOval(
          child: Image.asset('assets/tiet_logo.jpg',height: ScreenSize.height*0.125),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: AutoSizeText(
                'Welcome, Akshat!',
                maxLines: 1,
                style: Theme.of(context).textTheme.displayLarge?.copyWith(color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: AutoSizeText(
                'Here\'s all your attendance informaton!',
                maxLines: 1,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(color: Colors.white),
              ),
            )
          ],
        ),
        SizedBox(
          height: ScreenSize.height * .3,
        ),
        Container(
          alignment: Alignment.bottomLeft,
          height: ScreenSize.height * 0.4,
          child: CustomCard(),
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
