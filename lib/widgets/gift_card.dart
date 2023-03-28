import 'package:beach_combine/screens/Mine/purchase_screen.dart';
import 'package:beach_combine/screens/Mine/use_giftcard_screen.dart';
import 'package:beach_combine/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class GiftCard extends StatefulWidget {
  final String path;
  final String storeName;
  final String address;
  final int point;
  final int id;

  const GiftCard({
    super.key,
    required this.id,
    required this.path,
    required this.address,
    required this.storeName,
    required this.point,
  });

  @override
  State<GiftCard> createState() => _GiftCardState();
}

class _GiftCardState extends State<GiftCard> {
  final double? radius = 21;
  bool isPurchased = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isPurchased
            ? Get.to(UseGiftcardScreen())
            : Get.to(PurchaseScreen(
                point: widget.point,
                id: widget.id,
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
              backgroundImage: NetworkImage(widget.path),
            ),
            Gap(12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.storeName,
                  style: Styles.body12Text,
                ),
                Text(widget.address,
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
              "${widget.point}pt",
              style: Styles.body12Text,
            )
          ]),
        ),
      ),
    );
  }
}
