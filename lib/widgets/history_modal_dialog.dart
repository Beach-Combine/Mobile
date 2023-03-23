import 'package:beach_combine/models/my_record/my_record.dart';
import 'package:beach_combine/utils/app_style.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HistoryModalDialog extends StatefulWidget {
  final MyRecord record;

  HistoryModalDialog({super.key, required this.record});

  @override
  State<HistoryModalDialog> createState() => _HistoryModalDialogState();
}

class _HistoryModalDialogState extends State<HistoryModalDialog> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
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
              CarouselSlider(
                  carouselController: _controller,
                  items: widget.record.recordList.map((e) {
                    return Builder(builder: (context) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          right: 24,
                          left: 24,
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              Image.asset(
                                // 'assets/images/beaches/${e.beachId}.png',
                                'assets/icons/badge_ver2.png',
                                width: 56,
                              ),
                              Gap(12),
                              Text(
                                e.date,
                                style: Styles.body21Text
                                    .copyWith(color: Styles.gray1Color),
                              ),
                              _LocationText(
                                location: widget.record.beach.name,
                              ),
                              Gap(12),
                              _TimeRangeText(time: e.time, range: e.range),
                              Gap(12),
                              _BeforeAfterImage(
                                beforePath: e.beforeImage,
                                afterPath: e.afterImage,
                              ),
                            ],
                          ),
                        ),
                      );
                    });
                  }).toList(),
                  options: CarouselOptions(
                    aspectRatio: 16 / 8,
                    height: 320,
                    viewportFraction: 1,
                    autoPlay: false,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    },
                  )),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                      widget.record.recordList.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => _controller.animateToPage(entry.key),
                      child: Container(
                        width: 4.0,
                        height: 4.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                (Theme.of(context).brightness == Brightness.dark
                                        ? Colors.white
                                        : Colors.black)
                                    .withOpacity(
                                        _current == entry.key ? 0.9 : 0.4)),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        )
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
        Stack(children: [
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
        ]),
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
      return '${(range / 1000).toString()} km';
    } else {
      return '$range m';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Row(
            children: [
              Gap(16),
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
            width: 10,
            thickness: 1,
            color: Styles.gray1Color,
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Gap(4),
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
