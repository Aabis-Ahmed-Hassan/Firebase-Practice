import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practice/constants/app_colors.dart';
import 'package:firebase_practice/ui/auth/login_with_phone.dart';
import 'package:firebase_practice/ui/auth/signup_screen.dart';
import 'package:firebase_practice/ui/home_screen.dart';
import 'package:firebase_practice/utils/utils.dart';
import 'package:firebase_practice/widgets/my_round_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final _fbAuth = FirebaseAuth.instance;

  bool loading = false;
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void login() {
    setState(() {
      loading = true;
    });
    _fbAuth
        .signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((value) {
      Utils().showToastMessage(value.user!.email.toString());
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScren()));
      setState(() {
        loading = false;
      });
    }).onError((error, stackTrace) {
      Utils().showToastMessage(error.toString());
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      prefixIcon: Icon(Icons.alternate_email),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter email';
                      }
                    },
                  ),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      prefixIcon: Icon(
                        Icons.password,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter password';
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MyRoundButton(
                    title: 'Login',
                    loading: loading,
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        login();
                      }
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpScreen(),
                      ),
                    );
                  },
                  child: Text('Sign Up'),
                )
              ],
            ),
            MyRoundButton(
              title: 'Login with Phone',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginWithPhone()));
              },
              bgColor: Colors.white,
              textColor: AppColors.defaultColor,
            )
          ],
        ),
      ),
    );
  }
}
