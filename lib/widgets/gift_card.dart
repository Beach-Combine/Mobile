import 'package:beach_combine/screens/Mine/purchase_screen.dart';
import 'package:beach_combine/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class GiftCard extends StatelessWidget {
  final String path;
  final double? radius = 21;
  final String storeName;
  final String address;
  final int point;
  const GiftCard({
    super.key,
    required this.path,
    required this.address,
    required this.storeName,
    required this.point,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(PurchaseScreen(
          point: point,
        ));
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Styles.whiteColor, borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(children: [
            CircleAvatar(
              radius: radius,
              backgroundImage: AssetImage(path),
            ),
            Gap(12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  storeName,
                  style: Styles.body12Text,
                ),
                Text(address,
                    style: Styles.body3Text.copyWith(
                      color: Styles.gray1Color,
                    ))
              ],
            ),
            Spacer(),
            Image.asset(
              'assets/icons/point.png',
              width: 18,
            ),
            Text(
              "${point}pt",
              style: Styles.body12Text,
            )
          ]),
        ),
      ),
    );
  }
}
