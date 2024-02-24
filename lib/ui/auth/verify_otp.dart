import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practice/ui/home_screen.dart';
import 'package:firebase_practice/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../widgets/my_round_button.dart';

class VerifiyOTP extends StatefulWidget {
  String verificationId;

  VerifiyOTP({super.key, required this.verificationId});

  @override
  State<VerifiyOTP> createState() => _VerifiyOTPState();
}

class _VerifiyOTPState extends State<VerifiyOTP> {
  bool loading = false;
  final otpController = TextEditingController();

  final _fbAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.defaultColor,
        title: Text(
          'Verify Phone Number',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            TextFormField(
              controller: otpController,
              decoration: InputDecoration(
                hintText: 'Enter OTP',
              ),
            ),
            SizedBox(
              height: 50,
            ),
            MyRoundButton(
              title: 'Verify',
              loading: loading,
              onTap: () async {
                setState(() {
                  loading = true;
                });
                final token = PhoneAuthProvider.credential(
                    verificationId: widget.verificationId,
                    smsCode: otpController.text);
                try {
                  await _fbAuth.signInWithCredential(token);

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScren()));
                  setState(() {
                    loading = false;
                  });
                } catch (e) {
                  setState(() {
                    loading = false;
                  });

                  Utils().showToastMessage(e.toString());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
