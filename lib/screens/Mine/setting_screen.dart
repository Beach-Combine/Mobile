import 'package:beach_combine/controllers/auth_controller.dart';
import 'package:beach_combine/screens/Mine/account_screen.dart';
import 'package:beach_combine/utils/app_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});

  final authCtrl = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(CupertinoIcons.back),
          onPressed: () {
            Get.back();
          },
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView(children: [
          _ButtonText(
            onTap: () => Get.to(AccountScreen()),
            text: "Account",
          ),
          Divider(
            color: Styles.gray1Color,
            thickness: 1,
            height: 44,
          ),
          _ButtonText(
            onTap: () => authCtrl.logoutGoogle(),
            text: "Logout",
          ),
          Gap(44),
          _ButtonText(
            onTap: () => print('delete clicked'),
            text: "Delete Account",
          ),
          Gap(44),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Ver.',
                style: Styles.body12Text.copyWith(color: Styles.gray1Color),
              ),
              Text(
                '0.0.0',
                style: Styles.body12Text.copyWith(color: Styles.gray1Color),
              )
            ],
          )
        ]),
      ),
    );
  }
}

class _ButtonText extends StatelessWidget {
  final String text;
  Function()? onTap;
  _ButtonText({Key? key, required this.text, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: Styles.body12Text,
      ),
    );
  }
}
