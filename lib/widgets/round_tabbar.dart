import 'package:beach_combine/utils/app_style.dart';
import 'package:flutter/material.dart';

class RoundTabBar extends StatelessWidget with PreferredSizeWidget {
  final double barHeight = 48;

  const RoundTabBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + barHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(24.0),
        ),
      ),
      centerTitle: false,
      title: Text("Ranking", style: Styles.titleText),
      backgroundColor: Styles.primaryColor,
      bottom: TabBar(
        isScrollable: false,
        indicatorColor: Colors.black,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorWeight: 2,
        labelColor: Colors.black,
        unselectedLabelColor: Styles.whiteColor,
        labelStyle: Styles.body01Text,
        tabs: [
          Tab(text: "This month"),
          Tab(text: "All time"),
        ],
      ),
    );
  }
}
