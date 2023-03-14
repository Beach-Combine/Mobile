import 'package:beach_combine/utils/app_style.dart';
import 'package:beach_combine/widgets/black_button.dart';
import 'package:flutter/material.dart';

class SeparateHereBottomSheet extends StatelessWidget {
  final onPressed;
  const SeparateHereBottomSheet({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Wrap(children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24), topRight: Radius.circular(24))),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 24, right: 24, bottom: 24, top: 14),
            child: Column(
              children: [
                TextButton(
                  onPressed: onPressed,
                  child: Text(
                    'if the trash can is not registered on the map?',
                    style: Styles.body3Text.copyWith(
                      color: Styles.gray1Color,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                BlackButton(
                    height: 60,
                    text: 'Saparate the trash here and report it',
                    onTap: () async {})
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
