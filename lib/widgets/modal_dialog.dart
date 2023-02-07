import 'package:beach_combine/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ModalDialog extends StatelessWidget {
  final DateTime date;
  final String location;
  final String time;
  final int range;
  final String beforePath;
  final String afterPath;
  final String imagePath;

  const ModalDialog(
      {super.key,
      required this.date,
      required this.location,
      required this.range,
      required this.time,
      required this.afterPath,
      required this.beforePath,
      required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Container(
        height: 380,
        width: 268,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              _BackButton(),
              Image.asset(
                imagePath,
                width: 56,
              ),
              Gap(12),
              Text(
                DateFormat('yy.MM.dd').format(date),
                style: Styles.body21Text.copyWith(color: Styles.gray1Color),
              ),
              _LocationText(
                location: location,
              ),
              Gap(12),
              _TimeRangeText(time: time, range: range),
              Gap(12),
              _BeforeAfterImage(
                beforePath: beforePath,
                afterPath: afterPath,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BeforeAfterImage extends StatelessWidget {
  final String beforePath;
  final String afterPath;

  const _BeforeAfterImage({
    Key? key,
    required this.beforePath,
    required this.afterPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          beforePath,
          width: 104,
        ),
        Gap(12),
        Image.asset(
          afterPath,
          width: 104,
        ),
      ],
    );
  }
}

class _TimeRangeText extends StatelessWidget {
  final int range;
  final String time;

  const _TimeRangeText({
    required this.time,
    required this.range,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Time',
                style: Styles.detailText.copyWith(
                  color: Styles.gray1Color,
                )),
            Text(
              time,
              style: Styles.number2Text,
            )
          ],
        ),
        Container(
          height: 28,
          child: VerticalDivider(
            width: 20,
            thickness: 1,
            color: Styles.gray1Color,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Range',
              style: Styles.detailText.copyWith(color: Styles.gray1Color),
            ),
            Text(
              "${range}km",
              style: Styles.number2Text,
            )
          ],
        ),
        Gap(16),
      ],
    );
  }
}

class _LocationText extends StatelessWidget {
  final String location;
  const _LocationText({
    required this.location,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/icons/location_black.png',
          width: 16,
        ),
        Gap(4),
        Text(
          location,
          style: Styles.body12Text,
        ),
      ],
    );
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topRight,
        child: IconButton(
          iconSize: 30,
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.close),
          color: Styles.gray1Color,
        ));
  }
}
