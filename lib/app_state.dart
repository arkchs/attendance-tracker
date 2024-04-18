import 'package:attendance_track/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'
hide EmailAuthProvider;

class ApplicationState extends ChangeNotifier {
  ApplicationState() {
    init();
  }

  bool _isAuthenticated = false;
  bool get isAuthenticated => _isAuthenticated;

  Future<void> init() async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);

    FirebaseUIAuth.configureProviders(
      [EmailAuthProvider(),],
    );

    FirebaseAuth.instance.authStateChanges().listen((user){
      _isAuthenticated = user !=null;
      notifyListeners();
    }); 
  }
}
