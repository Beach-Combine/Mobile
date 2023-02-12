import 'package:beach_combine/utils/app_style.dart';
import 'package:beach_combine/widgets/modal_dialog.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class BadgeTile extends StatelessWidget {
  final DateTime date;
  final String location;

  const BadgeTile({super.key, required this.date, required this.location});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => ModalDialog(
                afterPath: 'assets/images/after.png',
                beforePath: 'assets/images/AdobeStock_210419020.png',
                date: DateTime.utc(2022, 4, 5),
                location: "Gwangalli Beach",
                imagePath: 'assets/icons/badge.png',
                range: 100,
                time: '00:59:59',
              )),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/list_badge.png',
              width: 80,
            ),
            Gap(12),
            Text(
              DateFormat('yy.MM.dd').format(date),
              style: Styles.body21Text.copyWith(
                color: Styles.gray1Color,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              location,
              style: Styles.body12Text,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
