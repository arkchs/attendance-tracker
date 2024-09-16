import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BottomBar extends StatelessWidget {
  final Size size;
  const BottomBar({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * .07,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () => Navigator.popAndPushNamed(context, '/'),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(
                    Icons.home_filled,
                    color: Colors.red,
                    size: 25.0,
                  ),
                  SizedBox(width: 5.0),
                  Text(
                    'Home',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.popAndPushNamed(context, 'Notes'),
            child: Container(
              height: size.height * .05,
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.sticky_note_2_outlined,
                    color: Colors.white,
                    size: 25,
                  ),
                  SizedBox(width: 5.0),
                  Text(
                    'Notes',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
