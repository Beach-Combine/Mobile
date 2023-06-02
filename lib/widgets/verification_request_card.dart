import 'package:beach_combine/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerificationRequestCard extends StatelessWidget {
  const VerificationRequestCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Get.to(page)
      },
      child: Container(
          child: Row(
        children: [
          Image.asset(
            'assets/icons/admin_profile.png',
            width: 54,
          ),
          SizedBox(
            width: 14,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'username',
                style: Styles.body12Text,
              ),
              Text(
                '22.04.05',
                style: Styles.body3Text.copyWith(color: Styles.gray1Color),
              ),
            ],
          ),
          Spacer(),
          Image.asset(
            'assets/icons/admin_trashcan_unchecked.png',
            width: 37,
          ),
        ],
      )),
    );
  }
}
