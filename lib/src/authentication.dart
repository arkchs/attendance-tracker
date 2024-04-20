import 'package:attendance_tracker/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthFunc extends StatelessWidget {
  const AuthFunc({
    super.key,
    required this.isAuthenticated,
    required this.signOut,
  });
  final bool isAuthenticated;
  final void Function() signOut;
  @override
  Widget build(BuildContext context) {
    TextTheme textThemeData = themeData.textTheme;
    TextButtonThemeData buttonStyle=themeData.textButtonTheme;
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24, bottom: 8),
          child: ElevatedButton(
            onPressed: () {
              !isAuthenticated ? context.push('/sign-in') : signOut();
            },
            style: ButtonStyle(
              elevation: buttonStyle.style?.elevation,
              backgroundColor: MaterialStatePropertyAll(Color.fromRGBO(235, 28, 34,1)),
            ),
            child: !isAuthenticated
                ? Text(
                    'Login',
                    style: textThemeData.labelMedium,
                  )
                : Text(
                    'Logout',
                    style: textThemeData.labelMedium,
                  ),
          ),
        ),
        Visibility(
          visible: isAuthenticated,
          child: Padding(
            padding: const EdgeInsets.only(left: 24, bottom: 8),
            child: ElevatedButton(
                onPressed: () {
                  context.push('/profile');
                },
                child: const Text('Profile')),
          ),
        )
      ],
    );
  }
}
