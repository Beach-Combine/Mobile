import 'package:beach_combine/utils/app_style.dart';
import 'package:beach_combine/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PointCard extends StatelessWidget {
  final int point;

  const PointCard({super.key, required this.point});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: Styles.whiteColor,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(24), bottomRight: Radius.circular(24)),
      ),
      child: Column(children: [
        Gap(5),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(8),
            Image.asset('assets/icons/point.png'),
            Gap(8),
            Text(
              '${point}',
              style: Styles.number1Text,
            ),
            Text(
              'pt',
              style: Styles.body02Text,
            )
          ],
        ),
        Gap(25),
        PrimaryButton(height: 60, text: "View exchange history")
      ]),
    );
  }
}
