import 'package:beach_combine/utils/app_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class TrashcanModal extends StatelessWidget {
  final String address;
  const TrashcanModal({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Wrap(children: [
        Container(
          width: 300,
          child: Padding(
            padding:
                const EdgeInsets.only(bottom: 40, left: 25, right: 25, top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _BackButton(),
                Image.asset(
                  'assets/icons/trashcan_modal.png',
                  width: 56,
                ),
                Gap(16),
                Text(
                  'address',
                  style: Styles.body3Text.copyWith(color: Styles.gray1Color),
                ),
                Gap(4),
                Container(
                  width: 200,
                  child: Text(
                    address,
                    maxLines: 200,
                    textAlign: TextAlign.center,
                    style: Styles.body22Text,
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
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
