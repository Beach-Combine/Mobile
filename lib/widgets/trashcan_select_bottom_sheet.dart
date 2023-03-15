import 'package:beach_combine/controllers/map_controller.dart';
import 'package:beach_combine/screens/Home/reward_screen.dart';
import 'package:beach_combine/utils/app_style.dart';
import 'package:beach_combine/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class TrashCanSelectBottomSheet extends StatelessWidget {
  TrashCanSelectBottomSheet({
    Key? key,
  }) : super(key: key);
  final controller = Get.find<MapController>();

  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24), topRight: Radius.circular(24))),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Image.asset(
                'assets/icons/trashcan.png',
                width: 35,
              ),
              Gap(12),
              Text(
                'You found a trash can!',
                style: Styles.body21Text,
              ),
              Text(
                'Please separate the trash',
                style: Styles.titleText,
              ),
              Gap(40),
              PrimaryButton(
                  height: 60,
                  text: 'Saparate the trash here',
                  onTap: () async {
                    final result = await controller.getPoint(0);
                    if (result) {
                      Get.offAll(RewardScreen(
                          location: 'location', isDifferentArea: false));
                    }
                  })
            ],
          ),
        ),
      ),
    ]);
  }
}
