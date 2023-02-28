import 'package:beach_combine/utils/app_style.dart';
import 'package:beach_combine/widgets/gift_card.dart';
import 'package:beach_combine/widgets/point_card.dart';
import 'package:flutter/material.dart';

class PointScreen extends StatefulWidget {
  const PointScreen({super.key});

  @override
  State<PointScreen> createState() => _PointScreenState();
}

class _PointScreenState extends State<PointScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Styles.gray3Color,
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(children: [
            PointCard(point: 20000),
            Padding(
              padding: const EdgeInsets.only(top: 24, left: 24, bottom: 12),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Gift cards list",
                  style: Styles.titleText,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 12),
              child: GiftCard(
                  path: "assets/images/store.png",
                  address: "Gangnam-gu",
                  storeName: "zero-waste store",
                  point: 1500),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 12),
              child: GiftCard(
                  path: "assets/images/store.png",
                  address: "Gangnam-gu",
                  storeName: "zero-waste store",
                  point: 1200),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 12),
              child: GiftCard(
                  path: "assets/images/store.png",
                  address: "Gangnam-gu",
                  storeName: "zero-waste store",
                  point: 900),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 12),
              child: GiftCard(
                  path: "assets/images/store.png",
                  address: "Gangnam-gu\nSeoul",
                  storeName: "zero-waste store",
                  point: 600),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 12),
              child: GiftCard(
                  path: "assets/images/store.png",
                  address: "Gangnam-gu",
                  storeName: "zero-waste store",
                  point: 300),
            ),
          ]),
        ),
      ),
    );
  }
}
