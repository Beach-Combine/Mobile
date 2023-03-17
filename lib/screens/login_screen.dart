import 'package:beach_combine/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  final authCtrl = Get.find<AuthController>();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/Logo_icon.png',
                  width: MediaQuery.of(context).size.width / 7,
                ),
                Gap(20),
                Image.asset(
                  'assets/images/Logo_text.png',
                  width: MediaQuery.of(context).size.width / 1.7,
                ),
                Gap(200),
                GestureDetector(
                  onTap: () {
                    authCtrl.signInWithGoogle();
                  },
                  child: Image.asset(
                    'assets/images/google_login_button.png',
                    width: MediaQuery.of(context).size.width / 1.5,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
