import 'package:beach_combine/controllers/mine_controller.dart';
import 'package:beach_combine/utils/app_style.dart';
import 'package:beach_combine/widgets/purchase_history.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class PurchaseHistoryScreen extends StatelessWidget {
  final int point;
  PurchaseHistoryScreen({super.key, required this.point});
  final controller = Get.find<MineController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _FlatAppBar(
        appBar: AppBar(),
      ),
      body: Obx(() {
        return Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: _CureentPointsText(point: point),
                  ),
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.purchaseList.length,
                      itemBuilder: (context, index) {
                        final purchase = controller.purchaseList[index];
                        return PurchaseHistory(
                          point: -purchase.cost,
                          date: DateTime.utc(2022, 9, 29),
                          path: purchase.image,
                          name: purchase.name,
                        );
                      }),
                ],
              ),
            ),
            controller.purchaseList.length == 0
                ? Center(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/empty_history.png',
                            width: 80,
                          ),
                          Gap(15),
                          Text(
                            'You don\'t have a\npurchase history.',
                            style: Styles.body02Text
                                .copyWith(color: Styles.gray1Color),
                          ),
                        ]),
                  )
                : Container()
          ],
        );
      }),
    );
  }
}

class _CureentPointsText extends StatelessWidget {
  const _CureentPointsText({
    Key? key,
    required this.point,
  }) : super(key: key);

  final int point;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("current points",
            style: Styles.body21Text.copyWith(color: Styles.gray1Color)),
        Row(
          children: [
            Text(
              "${point}",
              style: Styles.number1Text,
            ),
            Text(
              "pt",
              style: Styles.body02Text,
            )
          ],
        ),
      ],
    );
  }
}

class _FlatAppBar extends StatelessWidget with PreferredSizeWidget {
  final AppBar appBar;

  const _FlatAppBar({
    required this.appBar,
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: Icon(CupertinoIcons.back, color: Colors.black),
        onPressed: () {
          Get.back();
        },
      ),
      title: Text('Purchase history',
          style: Styles.body12Text.copyWith(color: Colors.black)),
      centerTitle: true,
      backgroundColor: Styles.whiteColor,
    );
  }
}
