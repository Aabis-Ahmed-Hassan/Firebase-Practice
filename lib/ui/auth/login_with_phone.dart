import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practice/constants/app_colors.dart';
import 'package:firebase_practice/ui/auth/verify_otp.dart';
import 'package:firebase_practice/utils/utils.dart';
import 'package:firebase_practice/widgets/my_round_button.dart';
import 'package:flutter/material.dart';

class LoginWithPhone extends StatefulWidget {
  const LoginWithPhone({super.key});

  @override
  State<LoginWithPhone> createState() => _LoginWithPhoneState();
}

class _LoginWithPhoneState extends State<LoginWithPhone> {
  final phoneController = TextEditingController();
  final _fbAuth = FirebaseAuth.instance;

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.defaultColor,
        title: Text(
          'Sign In with Phone',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
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
              controller: phoneController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter Your Number',
              ),
            ),
            SizedBox(
              height: 50,
            ),
            MyRoundButton(
              title: 'Send Code',
              loading: loading,
              onTap: () {
                setState(() {
                  loading = true;
                });

                _fbAuth.verifyPhoneNumber(
                    phoneNumber: phoneController.text,
                    verificationCompleted: (_) {
                      setState(() {
                        loading = false;
                      });
                    },
                    verificationFailed: (e) {
                      setState(() {
                        loading = false;
                      });

                      Utils().showToastMessage(
                        e.toString(),
                      );
                    },
                    codeSent: (String verificationId, int? token) {
                      setState(() {
                        loading = false;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              VerifiyOTP(verificationId: verificationId),
                        ),
                      );
                    },
                    codeAutoRetrievalTimeout: (e) {
                      setState(() {
                        loading = false;
                      });
                      Utils().showToastMessage(e.toString());
                    });
              },

              // onTap: () {
              //   setState(() {
              //     loading = true;
              //   });
              //
              //   _fbAuth.verifyPhoneNumber(
              //     phoneNumber: phoneController.text,
              //     verificationCompleted: (_) {
              //       setState(() {
              //         loading = false;
              //       });
              //     },
              //     verificationFailed: (e) {
              //       setState(() {
              //         loading = false;
              //       });
              //
              //       Utils().showToastMessage(e.toString());
              //     },
              //     codeSent: (String validationId, int? token) {
              //       setState(() {
              //         loading = false;
              //       });
              //     },
              //     codeAutoRetrievalTimeout: (e) {
              //       setState(() {
              //         loading = false;
              //       });
              //
              //       Utils().showToastMessage(e.toString());
              //     },
              //   );
              // },
            ),
          ],
        ),
      ),
    );
  }
}
