import 'package:beach_combine/screens/Home/different_area_screen.dart';
import 'package:beach_combine/screens/Home/nearby_trashcan_screen.dart';
import 'package:beach_combine/utils/app_style.dart';
import 'package:beach_combine/widgets/black_button.dart';
import 'package:beach_combine/widgets/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class MethodSelectScreen extends StatelessWidget {
  const MethodSelectScreen({super.key});

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
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
            width: double.infinity,
            child: Text(
              'Select a method\nfor throwing away your trash',
              style: Styles.titleText,
            ),
          ),
          Gap(94),
          Image.asset('assets/images/example.png'),
          Spacer(),
          PrimaryButton(
            height: 60,
            text: 'Nearby trash can',
            onTap: () => Get.to(NearbyTrashcanScreen()),
          ),
          Gap(12),
          BlackButton(
            height: 60,
            text: 'a different area',
            onTap: () => Get.to(DifferentAreaScreen()),
          )
        ]),
      ),
    );
  }
}
