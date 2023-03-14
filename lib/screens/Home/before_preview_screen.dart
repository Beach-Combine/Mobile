import 'dart:io';

import 'package:beach_combine/controllers/image_controller.dart';
import 'package:beach_combine/controllers/record_controller.dart';
import 'package:beach_combine/screens/Home/cleaning_screen.dart';
import 'package:beach_combine/utils/app_style.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:image_crop/image_crop.dart';

class BeforePreviewScreen extends StatelessWidget {
  final XFile picture;
  final onTap;
  final controller = Get.put(ImageController());

  BeforePreviewScreen({
    super.key,
    required this.picture,
    required this.onTap,
  });

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
          // child: Image.file(File(picture.path), fit: BoxFit.fitWidth),
          child: Image.file(File(picture.path)),
        ),
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
                        onPressed: () {
                          print('beforePicture 세팅');
                          controller.beforeImage = picture;
                          Get.offAll(CleaningScreen());
                        },
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

//   cropImage() async{
//     final file = picture;
// final bytes = await file.readAsBytes();
// final image = decodeImage(bytes);

//     // 이미지 crop
// final croppedFile = await ImageCrop.cropImage(
//   file: File(picture.path),
//   area: _getMaxSquareCropArea(picture.width, image.height),
// );

// // 최대크기 정사각형 crop 영역 계산
// Rect _getMaxSquareCropArea(int width, int height) {
//   final size = width > height ? height : width; // 가로, 세로 중 작은 값 선택
//   final x = (width - size) ~/ 2;
//   final y = (height - size) ~/ 2;
//   return Rect.fromLTWH(x.toDouble(), y.toDouble(), size.toDouble(), size.toDouble());
// }
//   }
}
