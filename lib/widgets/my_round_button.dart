import 'package:firebase_practice/constants/app_colors.dart';
import 'package:flutter/material.dart';

class MyRoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const MyRoundButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.defaultColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
