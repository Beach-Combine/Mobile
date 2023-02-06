import 'package:beach_combine/utils/app_style.dart';
import 'package:beach_combine/widgets/purchase_history.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PurchaseHistoryScreen extends StatelessWidget {
  final int point;
  const PurchaseHistoryScreen({super.key, required this.point});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _FlatAppBar(
        appBar: AppBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: _CureentPointsText(point: point),
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return PurchaseHistory(
                    point: -500,
                    date: DateTime.utc(2022, 9, 29),
                    path: "assets/images/store.png",
                    name: "zero-waste store",
                  );
                }),
          ],
        ),
      ),
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
