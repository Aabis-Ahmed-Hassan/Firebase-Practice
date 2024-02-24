import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practice/ui/auth/login_screen.dart';
import 'package:firebase_practice/ui/home_screen.dart';
import 'package:flutter/material.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    final _fbAuth = FirebaseAuth.instance;
    final user = _fbAuth.currentUser;

    if (user == null) {
      Timer(Duration(seconds: 3), () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
        );
      });
    } else {
      Timer(Duration(seconds: 3), () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScren(),
          ),
        );
      });
    }
  }
}
