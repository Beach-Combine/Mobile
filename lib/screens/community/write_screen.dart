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

  const WriteScreen(
      {super.key,
      required this.date,
      required this.location,
      required this.time,
      required this.range});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.whiteColor,
      appBar: _Appbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              _ReviewContent(date: date, location: location),
              ReviewFeild(),
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
  }) : super(key: key);

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
            onPressed: () {},
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
  }) : super(key: key);

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
                Image.asset(
                  "assets/images/AdobeStock_210419020.png",
                ),
                Gap(6),
                Image.asset(
                  "assets/images/after.png",
                ),
              ],
            )
          ]),
    );
  }
}
