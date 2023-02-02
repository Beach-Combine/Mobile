import 'package:beach_combine/utils/app_style.dart';
import 'package:flutter/material.dart';

class RankingCard extends StatelessWidget {
  final bool isMe;
  final String nickname;
  final String path;
  final int point;
  final int index;

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
      width: double.infinity,
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$index',
            style: Styles.body12Text,
          ),
          CircleAvatar(
            radius: 22,
            backgroundImage: AssetImage(path),
          ),
          Text('$nickname'),
          Spacer(),
          Text(
            '${point}pt',
            style: Styles.body21Text,
          )
        ],
      ),
    );
  }
}
