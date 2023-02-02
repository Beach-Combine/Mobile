import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/app_style.dart';

class TopRankerCard extends StatelessWidget {
  final double width;
  final String rankerPath;
  final String nickname;
  final int point;

  const TopRankerCard(
      {super.key,
      required this.width,
      required this.rankerPath,
      required this.nickname,
      required this.point});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: width,
          backgroundImage: AssetImage(rankerPath),
        ),
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
    );
  }
}
