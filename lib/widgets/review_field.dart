import 'package:beach_combine/utils/app_style.dart';
import 'package:flutter/material.dart';

class ReviewFeild extends StatelessWidget {
  const ReviewFeild({super.key, required this.controller});
  final controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: Styles.body21Text,
      keyboardType: TextInputType.multiline,
      maxLines: null,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: "Write your review",
        hintStyle: Styles.body21Text,
      ),
    );
  }
}
