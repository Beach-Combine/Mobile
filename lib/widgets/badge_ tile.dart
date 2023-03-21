import 'package:beach_combine/utils/app_style.dart';
import 'package:beach_combine/widgets/modal_dialog.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../models/record.dart';

class BadgeTile extends StatelessWidget {
  // final DateTime date;
  // final String location;
  final Record record;

  const BadgeTile({
    super.key,
    // required this.date,
    // required this.location,
    required this.record,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => ModalDialog(
                afterPath: record.afterImage,
                beforePath: record.beforeImage,
                date: DateFormat('yy.MM.dd').format(record.date),
                location: "Beach",
                imagePath: 'assets/images/badge_final.png',
                range: record.range,
                time: record.time,
              )),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/badge_final.png',
              width: 85,
            ),
            Gap(12),
            Text(
              DateFormat('yy.MM.dd').format(record.date),
              style: Styles.body21Text.copyWith(
                color: Styles.gray1Color,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              'location',
              style: Styles.body12Text,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
