import 'package:beach_combine/utils/app_style.dart';
import 'package:beach_combine/widgets/black_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class NoticeModal extends StatelessWidget {
  final onTap;
  const NoticeModal({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Wrap(children: [
        Container(
          width: 350,
          // decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(24),
          //     gradient: LinearGradient(
          //         begin: Alignment.topCenter,
          //         end: Alignment.bottomCenter,
          //         stops: [0.5, 0],
          //         colors: [Colors.white, Styles.gray3Color])),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/trashcan.png',
                      width: 18,
                    ),
                    Gap(4),
                    Text(
                      'if the trash can is not registered\non the map?',
                      textAlign: TextAlign.center,
                      style: Styles.body12Text,
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Styles.gray3Color,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(24),
                        bottomRight: Radius.circular(24))),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      Text(
                        'If you press the "Throw away here and prove it" button, You can take a picture of the trash can and report the location!',
                        textAlign: TextAlign.center,
                        style: Styles.body21Text,
                      ),
                      Gap(16),
                      Text(
                        'Only 30 points will be paid for throwing away into unregistered trash cans. After checking the location of the trash can, we will pay 70 points more.',
                        textAlign: TextAlign.center,
                        style:
                            Styles.body3Text.copyWith(color: Styles.gray1Color),
                      ),
                      Gap(22),
                      BlackButton(height: 60, text: "I got it", onTap: onTap),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
