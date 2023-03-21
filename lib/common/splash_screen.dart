import 'package:beach_combine/common/beach_combine.dart';
import 'package:beach_combine/controllers/auth_controller.dart';
import 'package:beach_combine/data.dart';
import 'package:beach_combine/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get_storage/get_storage.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    removeToken();
    checkToken();
    super.initState();
  }

  removeToken() async {
    await storage.remove(REFRESH_TOKEN_KEY);
    await storage.remove(ACCESS_TOKEN_KEY);
  }

  checkToken() async {
    final refreshToken = await storage.read(REFRESH_TOKEN_KEY);
    print(refreshToken);
    final accessToken = await storage.read(ACCESS_TOKEN_KEY);

    if (refreshToken == null || accessToken == null) {
      Future.delayed(Duration(milliseconds: 2000), () {
        Get.offAll(LoginScreen(), transition: Transition.fadeIn);
      });
    } else {
      Future.delayed(Duration(microseconds: 2000), () {
        Get.offAll(BeachCombine());
      });
    }
  }

  final storage = GetStorage();
  final authCtrl = Get.put(AuthController(), permanent: T);

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
                Padding(
                  padding: const EdgeInsets.all(13.5),
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
