import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/app_style.dart';

class TopRankerCard extends StatelessWidget {
  final double width;
  String? rankerPath;
  final String nickname;
  final int point;
  final int rank;

  TopRankerCard(
      {super.key,
      required this.width,
      required this.rankerPath,
      required this.nickname,
      required this.point,
      required this.rank});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Column(
        children: [
          rankerPath == null
              ? CircleAvatar(
                  radius: width,
                  backgroundImage: AssetImage('assets/images/nullprofile.png'))
              : CircleAvatar(
                  radius: width, backgroundImage: NetworkImage(rankerPath!)),
          Gap(20),
          Text(
            nickname,
            style: Styles.body12Text,
          ),
          Text(
            '${point}pt',
            style: Styles.body21Text,
          ),
        ],
      ),
      Positioned(
          right: 0, child: Image.asset('assets/icons/ranking_${rank}.png')),
    ]);
  }
}
