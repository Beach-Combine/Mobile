import 'package:beach_combine/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class PurchaseHistory extends StatelessWidget {
  final double radius = 21;
  final String path;
  final String name;
  final int point;
  final DateTime date;

  const PurchaseHistory(
      {required this.point,
      required this.path,
      required this.name,
      required this.date,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Styles.whiteColor, borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Row(children: [
          CircleAvatar(
            radius: radius,
            backgroundImage: NetworkImage(path),
          ),
          Gap(12),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: Styles.body12Text,
              ),
              Text(DateFormat('yy.MM.dd').format(date),
                  style: Styles.body3Text.copyWith(
                    color: Styles.gray1Color,
                  ))
            ],
          ),
          Spacer(),
          Image.asset(
            'assets/icons/point.png',
            width: 18,
          ),
          Gap(4),
          Text(
            "${point}pt",
            style: Styles.body12Text,
          )
        ]),
      ),
    );
    ;
  }
}
