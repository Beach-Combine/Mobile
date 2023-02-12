import 'package:beach_combine/screens/Home/cleaning_screen.dart';
import 'package:beach_combine/screens/Home/preview_screen.dart';
import 'package:beach_combine/utils/app_style.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BeforeCameraScreen extends StatefulWidget {
  final List<CameraDescription>? cameras;
  const BeforeCameraScreen({super.key, required this.cameras});

  @override
  State<BeforeCameraScreen> createState() => _BeforeCameraScreenState();
}

class _BeforeCameraScreenState extends State<BeforeCameraScreen> {
  late CameraController controller;
  late Future<void> _initializeControllerFuture;

  late double scale;

  @override
  void initState() {
    super.initState();
    controller = CameraController(widget.cameras![0], ResolutionPreset.max);
    _initializeControllerFuture = controller.initialize();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height / 4),
        child: AppBar(
          backgroundColor: Colors.black.withOpacity(0.7),
          leading: IconButton(
            icon: Icon(CupertinoIcons.back, color: Colors.white),
            onPressed: () {
              Get.back();
            },
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  children: [
                    Text(
                      'Please take a picture\nbefore cleaning',
                      style: Styles.titleText.copyWith(color: Colors.white),
                    ),
                    Text(
                      'You can use it when you write\nin the community.',
                      style:
                          Styles.body21Text.copyWith(color: Styles.gray2Color),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(children: [
              Transform.scale(
                  scale: 1 /
                      (controller.value.aspectRatio *
                          MediaQuery.of(context).size.aspectRatio),
                  alignment: Alignment.topCenter,
                  child: CameraPreview(controller)),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height / 4,
                  color: Colors.black.withOpacity(0.7),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: IconButton(
                          onPressed: () {
                            Get.to(PreviewScreen(
                              imagePath: "assets/images/beforepic.png",
                              onTap: () {
                                Get.offAll(CleaningScreen());
                              },
                            ));
                          },
                          iconSize: 65,
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          icon: Icon(Icons.circle, color: Styles.primaryColor),
                        )),
                      ]),
                ),
              )
            ]);
          } else {
            return Container(
                color: Colors.black,
                child: Center(
                    child: CircularProgressIndicator(
                  color: Styles.primaryColor,
                )));
          }
        },
      ),

      // Align(
      //     alignment: Alignment.bottomCenter,
      //     child: Container(
      //       height: MediaQuery.of(context).size.height * 0.20,
      //       decoration: const BoxDecoration(
      //           borderRadius:
      //               BorderRadius.vertical(top: Radius.circular(24)),
      //           color: Colors.black),
      //       child: Row(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             Expanded(
      //                 child: IconButton(
      //               onPressed: takePicture,
      //               iconSize: 50,
      //               padding: EdgeInsets.zero,
      //               constraints: const BoxConstraints(),
      //               icon: const Icon(Icons.circle, color: Colors.white),
      //             )),
      //           ]),
      //     )),
    );
  }
}
