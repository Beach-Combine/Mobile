import 'package:beach_combine/common/beach_combine.dart';
import 'package:beach_combine/controllers/map_controller.dart';
import 'package:beach_combine/utils/app_style.dart';
import 'package:beach_combine/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class RewardScreen extends StatelessWidget {
  final String location;
  final bool isDifferentArea;
  final String time;
  final int range;
  final String image;

  const RewardScreen({
    super.key,
    required this.location,
    required this.isDifferentArea,
    required this.time,
    required this.range,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Stack(children: [
            Image.asset('assets/images/sparkle.png'),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(),
                  Text(
                    'Thank you for your effort',
                    style: Styles.body12Text,
                  ),
                  Text(
                    'You got a badge!',
                    style: Styles.titleText,
                  ),
                  Gap(50),
                  Image.asset(
                   'assets/images/reward${Get.find<MapController>().selectedBeach}.png',
                    width: 165,
                  ),
                  Gap(15),
                  _LocationText(location: location),
                  Gap(20),
                  _TimeRangeTextBox(
                    time: time,
                    range: range,
                  ),
                  Spacer(),
                  isDifferentArea
                      ? Column(
                          children: [
                            Container(
                              width: 320,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: Text(
                                  'Only 30 points will be paid for throwing away into unregistered trash cans.\n After checking the location of the trash can, we will pay 70 points more.',
                                  textAlign: TextAlign.center,
                                  style: Styles.body3Text
                                      .copyWith(color: Styles.gray1Color),
                                ),
                              ),
                            ),
                          ],
                        )
                      : Gap(0),
                  PrimaryButton(
                      height: 60,
                      text:
                          isDifferentArea ? 'Get 30 points' : 'Get 100 points',
                      onTap: () {
                        Get.offAll(BeachCombine());
                      }),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class _TimeRangeTextBox extends StatelessWidget {
  final String time;
  final int range;
  const _TimeRangeTextBox({
    required this.time,
    required this.range,
    Key? key,
  }) : super(key: key);

  rangeRender() {
    if (range >= 1000) {
      return '${(range / 1000).toString()} km';
    } else {
      return '$range m';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Time',
              style: Styles.body21Text.copyWith(color: Styles.gray1Color),
            ),
            Text(
              time,
              style: Styles.number2Text,
            )
          ],
        ),
        Gap(40),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Range',
              style: Styles.body21Text.copyWith(color: Styles.gray1Color),
            ),
            Text(
              rangeRender(),
              style: Styles.number2Text,
            )
          ],
        )
      ],
    );
  }
}

class _LocationText extends StatelessWidget {
  const _LocationText({
    Key? key,
    required this.location,
  }) : super(key: key);

  final String location;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/icons/location_black.png',
          width: 18,
        ),
        Gap(5),
        Text(
          location,
          style: Styles.body12Text,
        )
      ],
    );
  }
}
