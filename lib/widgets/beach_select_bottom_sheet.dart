import 'package:beach_combine/controllers/map_controller.dart';
import 'package:beach_combine/screens/Home/camera_screen.dart';
import 'package:beach_combine/screens/Home/cleaning_screen.dart';
import 'package:beach_combine/screens/Home/preview_screen.dart';
import 'package:beach_combine/utils/app_style.dart';
import 'package:beach_combine/widgets/primary_button.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BeachSelectBottomSheet extends StatelessWidget {
  String name;
  double lat;
  double lng;
  int id;
  final controller = Get.put(MapController());
  BeachSelectBottomSheet({
    required this.name,
    required this.lat,
    required this.lng,
    required this.id,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24), topRight: Radius.circular(24))),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Image.asset(
                'assets/icons/beach_select.png',
                width: 35,
              ),
              Gap(12),
              Text(
                'You select a beach to clean',
                style: Styles.body21Text,
              ),
              Text(
                name,
                style: Styles.titleText,
              ),
              Gap(40),
              PrimaryButton(
                  height: 60,
                  text: 'Take a picture before cleaning',
                  onTap: () async {
                    final result =
                        await controller.checkBeachRange(lat, lng, id);
                    print(result);
                    controller.setSelectedBeach(id);
                    if (result) {
                      await availableCameras().then((value) => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => CameraScreen(
                                    cameras: value,
                                    onPressed: () {
                                      // Get.to(PreviewScreen(
                                      //   imagePath:
                                      //       "assets/images/beforepic.png",
                                      //   onTap: () {
                                      //     Get.offAll(CleaningScreen());
                                      //   },
                                      // ));
                                    },
                                  ))));
                    }
                  })
            ],
          ),
        ),
      ),
    ]);
  }
}
