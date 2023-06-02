import 'package:beach_combine/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:beach_combine/models/notification.dart' as noti;

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key, required this.notification});
  final noti.Notification notification;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  notification.title == 'points' &&
                          (notification.message.contains('70') ||
                              notification.message.contains('100'))
                      ? Row(
                          children: [
                            Container(
                              width: 5,
                              height: 5,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Styles.primaryColor),
                            ),
                            SizedBox(
                              width: 5,
                            )
                          ],
                        )
                      : SizedBox(),
                  Text(
                    notification.title,
                    style: Styles.body12Text.copyWith(color: Styles.gray1Color),
                  ),
                ],
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                notification.message,
                style: Styles.body12Text,
              ),
              SizedBox(
                height: 6,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 48,
                child: Text(
                  notification.details,
                  maxLines: 4,
                  style: Styles.body21Text,
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
