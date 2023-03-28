import 'package:beach_combine/controllers/mine_controller.dart';
import 'package:beach_combine/screens/Mine/use_giftcard_screen.dart';
import 'package:beach_combine/utils/app_style.dart';
import 'package:beach_combine/widgets/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class PurchaseScreen extends StatelessWidget {
  final int point;
  final int id;
  PurchaseScreen({super.key, required this.point, required this.id});
  final controller = Get.find<MineController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(CupertinoIcons.back),
          onPressed: () {
            Get.back();
          },
          color: Colors.black,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 34),
          child: Container(
              child: Column(
            children: [
              Gap(MediaQuery.of(context).size.height / 6),
              Text(
                'Do you want to\npurchase a gift card?',
                style: Styles.titleText,
                textAlign: TextAlign.center,
              ),
              Gap(32),
              Image.asset(
                'assets/images/store.png',
                width: 78,
              ),
              Gap(12),
              Text(
                'zero-waste store',
                style: Styles.body12Text,
              ),
              Text(
                "Gangnam-gu",
                style: Styles.body3Text.copyWith(color: Styles.gray1Color),
              ),
              Gap(36),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icons/point.png',
                    width: 28,
                  ),
                  Text(
                    '${point}pt',
                    style: Styles.body02Text,
                  ),
                ],
              ),
              Spacer(),
              PrimaryButton(
                  height: 60,
                  text: "Yes, I do",
                  onTap: () async {
                    print('clicked!');
                    final result = await controller.purchaseGiftcard(id);
                    if (true) {
                      Get.off(UseGiftcardScreen());
                    }
                  }),
            ],
          )),
        ),
      ),
    );
  }
}
