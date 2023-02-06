import 'package:beach_combine/screens/community/write_screen.dart';
import 'package:beach_combine/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SelectionCard extends StatelessWidget {
  final DateTime date;
  final String location;
  final String time;
  final int range;
  final bool isWritten;

  const SelectionCard(
      {super.key,
      required this.date,
      required this.location,
      required this.time,
      required this.range,
      required this.isWritten});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      GestureDetector(
        onTap: () {
          Get.to(WriteScreen(
            date: date,
            location: location,
            time: time,
            range: range,
          ));
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: Styles.whiteColor),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(DateFormat('yy.MM.dd').format(date),
                      style: Styles.body21Text.copyWith(
                        color: Styles.gray1Color,
                      )),
                  Gap(5),
                  Row(children: [
                    ImageIcon(
                      AssetImage('assets/icons/location_black.png'),
                    ),
                    Text(
                      location,
                      style: Styles.body12Text,
                    )
                  ]),
                  Gap(8),
                  Row(
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
                            style: Styles.detailText
                                .copyWith(color: Styles.gray1Color),
                          ),
                          Text(
                            "${range}km",
                            style: Styles.number2Text,
                          )
                        ],
                      ),
                    ],
                  )
                ]),
          ),
        ),
      ),
      isWritten
          ? Positioned.fill(
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xaaffffff),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  child: Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        "Already written",
                        style: Styles.body21Text
                            .copyWith(color: Styles.primaryColor),
                      )),
                ),
              ),
            )
          : SizedBox()
    ]);
  }
}
