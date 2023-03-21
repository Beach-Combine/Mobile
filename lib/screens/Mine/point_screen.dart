import 'package:beach_combine/controllers/mine_controller.dart';
import 'package:beach_combine/utils/app_style.dart';
import 'package:beach_combine/widgets/gift_card.dart';
import 'package:beach_combine/widgets/point_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class PointScreen extends StatelessWidget {
  final controller = Get.put(MineController());

  PointScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Styles.gray3Color,
        body: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Obx(
              () => Column(children: [
                PointCard(point: controller.point.value),
                Padding(
                  padding: const EdgeInsets.only(left: 24, top: 24),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Gift cards list',
                      style: Styles.titleText,
                    ),
                  ),
                ),
                ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 6),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: T,
                    itemCount: controller.giftcards.length,
                    itemBuilder: ((_, index) {
                      final giftcard = controller.giftcards[index];
                      return GiftCard(
                          path: giftcard.image,
                          address: giftcard.location,
                          storeName: giftcard.name,
                          point: giftcard.cost,
                          id : giftcard.id);
                    })),
              ]),
            )),
      ),
    );
  }
}
