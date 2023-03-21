import 'package:beach_combine/controllers/map_controller.dart';
import 'package:beach_combine/utils/app_style.dart';
import 'package:beach_combine/widgets/black_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class OutOfRangeTrashcanModal extends StatelessWidget {
  const OutOfRangeTrashcanModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: Center(
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/icons/trashcan.png',
                        width: 36,
                      ),
                      Gap(14),
                      Text('You\'re not near this trash can',
                          style: Styles.body12Text),
                      Gap(20),
                      BlackButton(
                          height: 52,
                          text: 'Choose again',
                          onTap: () => Get.back())
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
