import 'package:firebase_practice/constants/app_colors.dart';
import 'package:flutter/material.dart';

class MyRoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool loading;
  final Color bgColor;
  final Color textColor;
  MyRoundButton(
      {super.key,
      required this.title,
      required this.onTap,
      this.loading = false,
      this.textColor = Colors.white,
      this.bgColor = AppColors.defaultColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: AppColors.defaultColor,
            )),
        child: Center(
          child: loading
              ? CircularProgressIndicator(
                  color: Colors.white,
                )
              : Text(
                  title,
                  style: TextStyle(
                    fontSize: 24,
                    color: textColor,
                  ),
                ),
        ),
      ),
    );
  }
}
