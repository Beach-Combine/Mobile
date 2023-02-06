import 'package:beach_combine/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeAppbar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  HomeAppbar({Key? key})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // 투명색
    ));

    return Container(
      height: 100.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.0, 0.2),
          end: Alignment(0.0, 1.0),
          colors: <Color>[
            Colors.white.withOpacity(0.8),
            Colors.white.withOpacity(0.0)
          ],
        ),
      ),
      // child: Row(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       Padding(
      //         padding: const EdgeInsets.all(15.0),
      //         child: Text("Beach-Combine", style: Styles.titleText),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      //         child: ImageIcon(
      //           AssetImage("assets/icons/settings.png"),
      //           color: Styles.buttonBlackColor,
      //           size: 25,
      //         ),
      //       ),
      //     ]),
    );
  }
}
