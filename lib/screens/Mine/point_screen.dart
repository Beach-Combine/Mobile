import 'package:beach_combine/controllers/mine_controller.dart';
import 'package:beach_combine/utils/app_style.dart';
import 'package:beach_combine/widgets/gift_card.dart';
import 'package:beach_combine/widgets/point_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class PointScreen extends StatefulWidget {
  PointScreen({super.key});

  @override
  State<PointScreen> createState() => _PointScreenState();
}

class _PointScreenState extends State<PointScreen> {
  final controller = Get.put(MineController());

  @override
  void initState() {
    // TODO: implement initState
    controller.getPurchase();
    super.initState();
  }

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
                // PointCard(point: controller.testPoint.value),
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
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: GiftCard(
                            path: giftcard.image,
                            address: giftcard.location,
                            storeName: giftcard.name,
                            point: giftcard.cost,
                            id: giftcard.id),
                      );
                    })),
              ]),
            )),
      ),
    );
  }
}
