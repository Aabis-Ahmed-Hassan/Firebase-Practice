import 'package:firebase_practice/constants/app_colors.dart';
import 'package:flutter/material.dart';

class HomeScren extends StatelessWidget {
  const HomeScren({super.key});

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
              )
            ],
          ),
        ));
  }
}
