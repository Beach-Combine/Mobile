import 'package:beach_combine/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ModalDialog extends StatelessWidget {
  final String date;
  final String location;
  final String time;
  final int range;
  final String beforePath;
  final String afterPath;
  final String imagePath;
  final String? nickname;
  final bool isBadge;
  final int? beachId;

  const ModalDialog(
      {super.key,
      this.beachId,
      required this.isBadge,
      required this.nickname,
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
      child: Wrap(children: [
        Container(
          width: 280,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: _BackButton(),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 24, left: 24, bottom: 24),
                child: Column(
                  children: [
                    isBadge
                        ? Image.asset(
                            'assets/images/list$beachId.png',
                            width: MediaQuery.of(context).size.width / 6.5,
                          )
                        : Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(200),
                            ),
                            child: imagePath == 'lock'
                                ? CircleAvatar(
                                    backgroundImage:
                                        AssetImage('assets/icons/lock.png'),
                                    radius: 25,
                                  )
                                : CircleAvatar(
                                    backgroundImage: NetworkImage(imagePath),
                                    radius: 25,
                                  ),
                          ),
                    isBadge
                        ? Container()
                        : Text(
                            nickname!,
                            style: Styles.body02Text,
                          ),
                    Gap(12),
                    Text(
                      date,
                      style:
                          Styles.body21Text.copyWith(color: Styles.gray1Color),
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
            ],
          ),
        ),
      ]),
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
        Stack(
          children: [
            Container(
              color: Styles.gray1Color,
              width: 104,
              height: 104,
            ),
            Image.network(
              beforePath,
              width: 104,
              height: 104,
              fit: BoxFit.fill,
            ),
          ],
        ),
        Gap(12),
        Stack(
          children: [
            Container(
              color: Styles.gray1Color,
              width: 104,
              height: 104,
            ),
            Image.network(
              afterPath,
              width: 104,
              height: 104,
              fit: BoxFit.fill,
            ),
          ],
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

  rangeRender() {
    if (range >= 1000) {
      return '${(range / 1000).floor().toString()} km';
    } else {
      return '$range m';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Row(
            children: [
              Gap(14),
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
            ],
          ),
        ),
        Container(
          height: 28,
          child: VerticalDivider(
            width: 20,
            thickness: 1,
            color: Styles.gray1Color,
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Gap(2),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Range',
                    style: Styles.detailText.copyWith(color: Styles.gray1Color),
                  ),
                  Text(
                    rangeRender(),
                    style: Styles.number2Text,
                  )
                ],
              ),
            ],
          ),
        ),
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
