import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practice/constants/app_colors.dart';
import 'package:firebase_practice/ui/auth/login_screen.dart';
import 'package:firebase_practice/utils/utils.dart';
import 'package:flutter/material.dart';

class HomeScren extends StatelessWidget {
  HomeScren({super.key});

  final _fbAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.defaultColor,
          automaticallyImplyLeading: false,
          title: Text(
            'Home Screen',
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Home Screen',
                style: TextStyle(
                  fontSize: 35,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  _fbAuth.signOut().then((value) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  }).onError((error, stackTrace) {
                    Utils().showToastMessage(error.toString());
                  });
                },
                child: Container(
                  height: 50,
                  width: 250,
                  color: AppColors.defaultColor,
                  child: Center(
                    child: Text(
                      'Logout',
                      style: TextStyle(color: Colors.white, fontSize: 28),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
