import 'package:beach_combine/screens/Home/cleaning_screen.dart';
import 'package:beach_combine/utils/app_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class PreviewScreen extends StatelessWidget {
  final String imagePath;
  final onTap;

  const PreviewScreen(
      {super.key, required this.imagePath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height / 4),
        child: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: Icon(CupertinoIcons.back, color: Colors.white),
            onPressed: () {
              Get.back();
            },
          ),
        ),
      ),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Stack(children: [
        Center(
            child: Image.asset(
          imagePath,
          width: double.infinity,
          fit: BoxFit.fitWidth,
        )),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: MediaQuery.of(context).size.height / 4,
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          'Again',
                          style: Styles.body02Text
                              .copyWith(color: Styles.whiteColor),
                        )),
                    TextButton(
                        onPressed: onTap,
                        child: Text(
                          'Ok',
                          style: Styles.body02Text
                              .copyWith(color: Styles.whiteColor),
                        )),
                  ]),
            ),
          ),
        ),
      ]),
    );
  }
}
