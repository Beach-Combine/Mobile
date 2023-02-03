import 'package:beach_combine/utils/app_style.dart';
import 'package:flutter/material.dart';

class FlatTabBar extends StatelessWidget with PreferredSizeWidget {
  final double barHeight = 48;
  final TabBar tabBar;
  final BoxDecoration decoration;

  const FlatTabBar({super.key, required this.tabBar, required this.decoration});

  @override
  Size get preferredSize => tabBar.preferredSize;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: Container(decoration: decoration)),
        tabBar,
      ],
    );
  }
}
