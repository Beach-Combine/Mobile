import 'package:beach_combine/data.dart';
import 'package:beach_combine/screens/Home/after_preview_screen.dart';
import 'package:beach_combine/screens/Home/cleaning_screen.dart';
import 'package:beach_combine/screens/Home/preview_page.dart';
import 'package:beach_combine/screens/Home/before_preview_screen.dart';
import 'package:beach_combine/screens/Home/report_preview_screen.dart';
import 'package:beach_combine/utils/app_style.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportCameraScreen extends StatefulWidget {
  final List<CameraDescription>? cameras;

  final bool isTest;

  const ReportCameraScreen({
    super.key,
    required this.cameras,
    this.isTest = false,
  });

  @override
  State<ReportCameraScreen> createState() => _ReportCameraScreenState();
}

class _ReportCameraScreenState extends State<ReportCameraScreen> {
  late CameraController controller;
  late Future<void> _initializeControllerFuture;

  late double scale;

  @override
  void initState() {
    super.initState();
    //initCamera(widget.cameras![0]);
    controller = CameraController(widget.cameras![0], ResolutionPreset.max);
    _initializeControllerFuture = controller.initialize();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future takePicture() async {
    if (controller.value.isTakingPicture) {
      return null;
    }
    try {
      await controller.setFlashMode(FlashMode.off);
      print('시작');
      XFile picture = await controller.takePicture();
      print('끝');
      Get.to(ReportPreviewScreen(picture: picture, isTest: widget.isTest,));
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => PreviewPage(
      //               picture: picture,
      //             )));
    } on CameraException catch (e) {
      debugPrint('Error occured while taking picture: $e');
      return null;
    }
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
                      'Report the\ntrash can location',
                      style: Styles.titleText.copyWith(color: Colors.white),
                    ),
                    Text(
                      'If you send us the picture,\nwe will check it.',
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
                                // onPressed: widget.onPressed,
                                onPressed: takePicture,
                                iconSize: 65,
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                                icon: Image.asset(
                                    'assets/icons/camerabutton.png'))),
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
    );
  }
}
