import 'package:beach_combine/controllers/community_controller.dart';
import 'package:beach_combine/utils/app_style.dart';
import 'package:beach_combine/widgets/flat_appbar.dart';
import 'package:beach_combine/widgets/selection_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class SelectToWriteScreen extends StatelessWidget {
  final controller = Get.find<CommunityController>();

  SelectToWriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Styles.gray3Color,
        appBar: AppBar(
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
          backgroundColor: Styles.gray3Color,
          elevation: 0,
        ),
        body: Obx(() {
          if (controller.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(
                color: Styles.primaryColor,
              ),
            );
          }
          if (controller.records.isEmpty) {
            return Center(
              child: Text(
                '청소 기록이 없습니다\n해변을 청소하고 기록을 남겨보세요!',
                style: Styles.titleText,
                textAlign: TextAlign.center,
              ),
            );
          }
          return ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 14),
              itemCount: 10,
              itemBuilder: ((context, index) {
                final isWritten = (index == 3 || index == 4) ? true : false;
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  child: SelectionCard(
                    isWritten: isWritten,
                    date: DateTime.utc(2022, 4, 5),
                    location: "Gwangalli Beach",
                    range: 100,
                    time: "03:59:59",
                  ),
                );
              }));
        }));
  }
}
