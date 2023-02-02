import 'package:beach_combine/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeAppbar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  HomeAppbar({Key? key})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.0, 0.0),
          end: Alignment(0.0, 0.7),
          colors: <Color>[Colors.white, Colors.white.withOpacity(0.0)],
        ),
      ),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("Beach-Combine", style: Styles.titleText),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ImageIcon(
                AssetImage("assets/icons/settings.png"),
                color: Styles.buttonBlackColor,
                size: 40,
              ),
            ),
          ]),
    );
  }
}
