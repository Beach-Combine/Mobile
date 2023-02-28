import 'package:beach_combine/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RankingCard extends StatelessWidget {
  final bool isMe;
  final String nickname;
  final String path;
  final int point;
  final int index;

  String changePoint(point) {
    if (point >= 10000000) {
      return '${(point / 1000000).round()} m';
    }
    if (point >= 100000) {
      return '${(point / 1000000).round()} k';
    }
    return '${point}';
  }

  const RankingCard(
      {super.key,
      required this.nickname,
      required this.isMe,
      required this.path,
      required this.point,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isMe ? Color(0x445CDEB7) : Styles.whiteColor,
      width: double.infinity,
      height: 80,
      child: Stack(children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 24, right: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$index',
                  style: Styles.body12Text,
                ),
                Gap(30),
                CircleAvatar(
                  radius: 22,
                  backgroundImage: AssetImage(path),
                ),
                Gap(15),
                Text(
                  '$nickname',
                  style: Styles.body12Text,
                ),
                Spacer(),
                Text(
                  '${changePoint(point)} pt',
                  style: Styles.body21Text,
                )
              ],
            ),
          ),
        ),
        isMe
            ? Container(
                color: Styles.primaryColor,
                height: 80,
                width: 10,
              )
            : Gap(0)
      ]),
    );
  }
}
