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
  final String path;
  final String address;
  final String storeName;

  PurchaseScreen({
    super.key,
    required this.point,
    required this.id,
    required this.path,
    required this.address,
    required this.storeName,
  });

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
                CircleAvatar(
                  backgroundImage: NetworkImage(path),
                  radius: 48,
                ),
                Gap(12),
                Text(
                  storeName,
                  style: Styles.body12Text,
                ),
                Text(
                  address,
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
                    if (result) {
                      Get.off(
                        UseGiftcardScreen(
                          path: path,
                          address: address,
                          storeName: storeName,
                        ),
                      );
                      controller.point.value -= point;
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
