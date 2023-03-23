import 'package:beach_combine/controllers/mine_controller.dart';
import 'package:beach_combine/utils/app_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:flutter_switch/flutter_switch.dart';

class AccountScreen extends StatefulWidget {
  AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final profileController = Get.find<MineController>();

  late TextEditingController nameController;
  late TextEditingController emailController;
  late String nickname;
  late String email;
  @override
  void initState() {
    nickname = profileController.member.value.nickname;
    email = profileController.member.value.email;
    nameController =
        TextEditingController(text: nickname);
    emailController =
        TextEditingController(text: email);
    super.initState();
  }

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
        actions: [
          Obx(() {
              return profileController.showEditButton.value
                  ? TextButton(
                      onPressed: () {
                        profileController.editAccount(nameController);
                      },
                      child: Text(
                        'Done',
                        style:
                            Styles.body12Text.copyWith(color: Styles.primaryColor),
                      ),
                    )
                  : Container();
            }
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage:
                  NetworkImage(profileController.member.value.image),
              radius: MediaQuery.of(context).size.width * (3 / 20),
            ),
            Gap(28),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  _NameTextField(
                    controller: nameController,
                  ),
                  Gap(12),
                  _EmailTextField(controller: emailController)
                ],
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Hide profile on Home map',
                        style: Styles.body12Text,
                      ),
                      Spacer(),
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
                  Gap(12),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/icons/profile_info.png',
                        width: 16,
                      ),
                      Gap(8),
                      Text(
                        'If you choose to hide your profile on home map,\nyour profile picture and name will not be shown\nin the cleaning history displayed on the home map.',
                        style: Styles.detailText
                            .copyWith(color: Styles.gray1Color),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _NameTextField extends StatelessWidget {
  _NameTextField({
    required this.controller,
    Key? key,
  }) : super(key: key);
  final controller;
  final mineController = Get.find<MineController>();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'Name',
          style: Styles.body12Text,
        ),
        Spacer(),
        SizedBox(
            height: 42,
            width: 250,
            child: TextFormField(
              onChanged: (value) {
                mineController.editedName.value = value;
                mineController.setShowEditButton();
              },
              controller: controller,
              style: Styles.body21Text.copyWith(height: 1),
              cursorColor: Styles.primaryColor,
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
  _EmailTextField({
    required this.controller,
    Key? key,
  }) : super(key: key);
  final controller;
  final mineController = Get.find<MineController>();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'E-mail',
          style: Styles.body12Text,
        ),
        Spacer(),
        SizedBox(
            height: 42,
            width: 250,
            child: TextFormField(
              controller: controller,
              onChanged: (value) {
                mineController.editedEmail.value = value;
                mineController.setShowEditButton();
              },
              style: Styles.body21Text.copyWith(height: 1),
              cursorColor: Styles.primaryColor,
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
