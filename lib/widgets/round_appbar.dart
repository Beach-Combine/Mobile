import 'package:beach_combine/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class RoundAppBar extends StatelessWidget with PreferredSizeWidget {
  final double barHeight = 48;
  final String title;
  final IconButton iconButton;

  RoundAppBar({Key? key, required this.title, required this.iconButton})
      : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + barHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Styles.primaryColor,
      centerTitle: false,
      title: Text(
        title,
        style: Styles.titleText,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(24.0),
        ),
      ),
      actions: [iconButton],
    );
  }
}
