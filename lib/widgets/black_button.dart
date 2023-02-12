import 'package:beach_combine/screens/Mine/purchase_history_screen.dart';
import 'package:beach_combine/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BlackButton extends StatelessWidget {
  final String text;
  final double height;
  final int? point;
  final onTap;

  const BlackButton(
      {super.key,
      required this.height,
      required this.text,
      this.point,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: Colors.black),
          child: Center(
            child: Text(
              '$text',
              style: Styles.body12Text.copyWith(color: Colors.white),
            ),
          ),
        ));
  }
}
