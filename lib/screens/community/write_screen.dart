import 'package:beach_combine/common/beach_combine.dart';
import 'package:beach_combine/controllers/community_controller.dart';
import 'package:beach_combine/screens/community/community_screen.dart';
import 'package:beach_combine/utils/app_style.dart';
import 'package:beach_combine/widgets/review_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class WriteScreen extends StatelessWidget {
  final DateTime date;
  final String location;
  final String time;
  final int range;
  final String beforeImage;
  final String afterImage;
  final int id;
  const WriteScreen(
      {super.key,
      required this.beforeImage,
      required this.afterImage,
      required this.date,
      required this.location,
      required this.time,
      required this.range,
      required this.id});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return Scaffold(
      backgroundColor: Styles.whiteColor,
      appBar: _Appbar(
        controller: controller,
        id: id,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              _ReviewContent(
                date: date,
                location: location,
                beforeImage: beforeImage,
                afterImage: afterImage,
              ),
              ReviewFeild(
                controller: controller,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Appbar extends StatelessWidget with PreferredSizeWidget {
  _Appbar({
    Key? key,
    required this.id,
    required this.controller,
  }) : super(key: key);
  final controller;
  final id;
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(CupertinoIcons.back, color: Colors.black),
        onPressed: () {
          Get.back();
        },
      ),
      title: Text(
        "Select to write",
        style: Styles.body12Text.copyWith(color: Colors.black),
      ),
      centerTitle: true,
      backgroundColor: Styles.whiteColor,
      elevation: 0,
      actions: [
        TextButton(
            onPressed: () {
              print(controller.text);
              Get.find<CommunityController>().postFeed(id, controller.text);
              Get.find<CommunityController>().onInit();

              Get.offAll(BeachCombine(), arguments: 2);
            },
            child: Text(
              'Submit',
              style: Styles.body12Text.copyWith(color: Styles.primaryColor),
            ))
      ],
    );
  }
}

class _ReviewContent extends StatelessWidget {
  const _ReviewContent({
    Key? key,
    required this.date,
    required this.location,
    required this.afterImage,
    required this.beforeImage,
  }) : super(key: key);
  final String beforeImage;
  final String afterImage;
  final DateTime date;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Styles.whiteColor),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(DateFormat('yy.MM.dd').format(date),
                style: Styles.body21Text.copyWith(
                  color: Styles.gray1Color,
                )),
            Gap(5),
            Row(children: [
              ImageIcon(
                AssetImage('assets/icons/location_black.png'),
              ),
              Text(
                location,
                style: Styles.body12Text,
              )
            ]),
            Gap(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  beforeImage,
                  width: MediaQuery.of(context).size.width / 2.5,
                  height: MediaQuery.of(context).size.width / 2.5,
                  fit: BoxFit.fill,
                ),
                Gap(6),
                Image.network(
                  afterImage,
                  width: MediaQuery.of(context).size.width / 2.5,
                  height: MediaQuery.of(context).size.width / 2.5,
                  fit: BoxFit.fill,
                ),
              ],
            )
          ]),
    );
  }
}
