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
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24, bottom: 8),
          child: ElevatedButton(
            onPressed: () {
              !isAuthenticated ? context.push('/sign-in') : signOut();
            },
            child: !isAuthenticated
                ? const Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  )
                : const Text(
                    'Logout',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.red),
              elevation: MaterialStatePropertyAll(0),
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
