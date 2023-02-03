import 'package:beach_combine/utils/app_style.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final double height;

  const PrimaryButton({super.key, required this.height, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          print(text);
        },
        child: Container(
          width: double.infinity,
          height: height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Styles.buttonPrimaryColor),
          child: Center(
            child: Text(
              '$text',
              style: Styles.body12Text,
            ),
          ),
        ));
  }
}
