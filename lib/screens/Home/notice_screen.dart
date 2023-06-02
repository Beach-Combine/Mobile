import 'package:beach_combine/controllers/notice_controller.dart';
import 'package:beach_combine/utils/app_style.dart';
import 'package:beach_combine/widgets/notification_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoticeScreen extends StatefulWidget {
  NoticeScreen({super.key});

  @override
  State<NoticeScreen> createState() => _NoticeScreenState();
}

class _NoticeScreenState extends State<NoticeScreen> {
  final NoticeController noticeCtrl = Get.put(NoticeController());
  @override
  void dispose() {
    Get.delete<NoticeController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: _appBar(),
        body: Obx(() {
          return noticeCtrl.notifications.isNotEmpty
              ? ListView.separated(
                  itemBuilder: (context, index) {
                    final item = noticeCtrl.notifications[index];
                    return NotificationCard(
                      notification: item,
                    );
                  },
                  separatorBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: SizedBox(
                          height: 48,
                          child: Divider(
                            thickness: 1,
                            color: Styles.gray3Color,
                          ),
                        ),
                      ),
                  itemCount: noticeCtrl.notifications.length)
              : SizedBox();
        }));
  }

  AppBar _appBar() {
    return AppBar(
      leading: IconButton(
        icon: Icon(CupertinoIcons.back, color: Colors.black),
        onPressed: () {
          Get.back();
        },
      ),
      title: Text(
        'Notice',
        style: Styles.body02Text.copyWith(color: Colors.black),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
    );
  }
}
