import 'package:beach_combine/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FlatAppBar extends StatelessWidget with PreferredSizeWidget {
  final double barHeight = 0;
  final String title;
  final IconButton iconButton;

  FlatAppBar({Key? key, required this.title, required this.iconButton})
      : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Styles.whiteColor // 원하는 색
            ));
    return AppBar(
      elevation: 0,
      backgroundColor: Styles.whiteColor,
      centerTitle: false,
      title: Text(
        title,
        style: Styles.titleText,
      ),
      actions: [iconButton],
    );
  }
}
