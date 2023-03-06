import 'package:beach_combine/controllers/profile_controller.dart';
import 'package:beach_combine/utils/app_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:flutter_switch/flutter_switch.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({super.key});
  final profileController = Get.put(ProfileController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Write',
          style: Styles.body12Text.copyWith(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(CupertinoIcons.back),
          onPressed: () {
            Get.back();
          },
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage:
                  NetworkImage('https://picsum.photos/id/237/200/300'),
              radius: MediaQuery.of(context).size.width * (3 / 20),
            ),
            Gap(28),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [_NameTextField(), Gap(12), _EmailTextField()],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Divider(
                color: Styles.gray3Color,
                thickness: 1,
                height: 44,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Hide profile on Home map',
                  style: Styles.body12Text,
                ),
                Gap(70),
                Obx(() => FlutterSwitch(
                    width: 50,
                    height: 30,
                    toggleSize: 25,
                    padding: 2,
                    activeColor: Styles.primaryColor,
                    value: profileController.status.value,
                    borderRadius: 50,
                    onToggle: (value) {
                      profileController.switchStatus();
                    }))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _NameTextField extends StatelessWidget {
  const _NameTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'Name',
          style: Styles.body12Text,
        ),
        Gap(28),
        SizedBox(
            height: 42,
            width: 250,
            child: TextFormField(
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Styles.gray3Color, width: 1.0),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Styles.gray3Color, width: 1.0),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  filled: true,
                  fillColor: Styles.gray3Color,
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Styles.gray3Color, width: 1.0),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  isDense: true),
            )),
      ],
    );
  }
}

class _EmailTextField extends StatelessWidget {
  const _EmailTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'E-mail',
          style: Styles.body12Text,
        ),
        Gap(28),
        SizedBox(
            height: 42,
            width: 250,
            child: TextFormField(
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Styles.gray3Color, width: 1.0),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Styles.gray3Color, width: 1.0),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  filled: true,
                  fillColor: Styles.gray3Color,
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Styles.gray3Color, width: 1.0),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  isDense: true),
            )),
      ],
    );
  }
}
