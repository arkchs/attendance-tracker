import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class FunkyTextAnimation extends StatefulWidget {
  const FunkyTextAnimation({super.key});

  @override
  State<FunkyTextAnimation> createState() => _FunkyTextAnimationState();
}

class _FunkyTextAnimationState extends State<FunkyTextAnimation> {
  @override
  Widget build(BuildContext context) {
    return CustomTitle();
  }
}

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: size.height * 0.035,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Text(
            'Welcome, Akshat!',
            style: Theme.of(context)
                .textTheme
                .displayLarge
                ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
          ).animate(effects: [
            FadeEffect(
              duration: const Duration(milliseconds: 1000),
            ),
            SlideEffect(
              duration: const Duration(milliseconds: 1000),
              begin: Offset(-10, 0),
              end: Offset(0, 0),
            ),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Text(
            'Here\' all your attendance related information!',
            style: Theme.of(context)
                .textTheme
                .displaySmall
                ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
          ).animate(effects: [
            FadeEffect(
              duration: const Duration(milliseconds: 1000),
            ),
            SlideEffect(
              duration: const Duration(milliseconds: 1000),
              begin: Offset(-10, 0),
              end: Offset(0, 0),
            ),
          ]),
        )
      ],
    );
  }
}
