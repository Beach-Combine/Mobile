import 'package:beach_combine/controllers/record_controller.dart';
import 'package:beach_combine/screens/Home/different_area_screen.dart';
import 'package:beach_combine/screens/Home/nearby_trashcan_screen_temp.dart';
import 'package:beach_combine/screens/Home/saperate_trash_screen.dart';
import 'package:beach_combine/utils/app_style.dart';
import 'package:beach_combine/widgets/black_button.dart';
import 'package:beach_combine/widgets/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class MethodSelectScreen extends StatelessWidget {
  MethodSelectScreen({super.key});

  final recordController = Get.put(RecordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(CupertinoIcons.back, color: Colors.black),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Stack(children: [
        Padding(
          padding: EdgeInsets.all(24),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.only(top: 250),
              child: Container(
                width: double.infinity,
                child: Text(
                  'Thank you\n for your effort!',
                  textAlign: TextAlign.center,
                  style: Styles.titleText,
                ),
              ),
            ),
            Spacer(),
            PrimaryButton(
              height: 60,
              text: 'Go to seperate the trash',
              onTap: () => Get.offAll(SeperateTrashScreen()),
            ),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 130),
          child: Center(
            child: Image.asset(
              'assets/images/stars.png',
              width: 300,
            ),
          ),
        ),
      ]),
    );
  }
}
