import 'package:flutter/material.dart';

class MyBackDrop extends StatelessWidget {
  const MyBackDrop({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: Duration(seconds: 5),
      builder: (context, double value, child) {
        return Transform.translate(
          offset: Offset(0, size.height * 0.4 * (value - 1)),
          child: child,
        );
      },
      child: ClipPath(
        clipper: ClipCustom(),
        child: Container(
          height: size.height * 0.77,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            shape: BoxShape.rectangle,
          ),
        ),
      ),
    );
  }
}

class ClipCustom extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height * 0.7);
    path.quadraticBezierTo(size.width * .25, size.height * 0.65, size.width / 2,
        size.height * 0.7);
    path.quadraticBezierTo(
        size.width * .75, size.height * 0.75, size.width, size.height * 0.7);
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
