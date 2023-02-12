import 'dart:ui' as ui;

import 'package:beach_combine/controllers/time_controller.dart';
import 'package:beach_combine/screens/Home/after_camera_screen.dart';
import 'package:beach_combine/screens/Home/camera_screen.dart';
import 'package:beach_combine/utils/app_style.dart';
import 'package:beach_combine/utils/map_manager.dart';
import 'package:beach_combine/widgets/home_appbar.dart';
import 'package:beach_combine/widgets/primary_button.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CleaningScreen extends StatefulWidget {
  const CleaningScreen({super.key});

  @override
  State<CleaningScreen> createState() => _CleaningScreenState();
}

class _CleaningScreenState extends State<CleaningScreen> {
  GoogleMapController? mapController;
  Set<Marker> markers = Set();
  LatLng sourceLocation = LatLng(35.15371303154973, 129.11984887319667);
  LatLng destination = LatLng(35.153884196941334, 129.11847977037488);
  LatLng trashcan1 = LatLng(35.15458529236469, 129.1213574320733);
  LatLng trashcan2 = LatLng(35.15334245544671, 129.11916901035525);
  LatLng beach = LatLng(35.15411732197925, 129.12055697747124);
  final timecontroller = Get.put(TimerController());

  @override
  void initState() {
    _addMarkers();
    super.initState();
  }

  _addMarkers() async {
    final Marker selfmarker = await MapMananger.resizeImage(
        sourceLocation, 'assets/icons/selfmarker.png', 'self', 180, (() {
      print('Clicked');
    }));

    setState(() {
      markers.add(selfmarker);
    });
  }

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   showModalBottomSheet(
    //     shape: const RoundedRectangleBorder(
    //       // <-- SEE HERE
    //       borderRadius: BorderRadius.vertical(
    //         top: Radius.circular(25.0),
    //       ),
    //     ),
    //     barrierColor: Colors.transparent,
    //     isDismissible: false,
    //     enableDrag: false,
    //     context: context,
    //     builder: (BuildContext context) {
    //       return _BottomSheetCleaning(timecontroller: timecontroller);
    //     },
    //   );
    // });
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        body: Stack(children: [
          GoogleMap(
            zoomGesturesEnabled: true,
            zoomControlsEnabled: false,
            myLocationButtonEnabled: true,
            initialCameraPosition:
                CameraPosition(target: sourceLocation, zoom: 16.5),
            markers: markers,
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: _BottomSheetCleaning(timecontroller: timecontroller))
        ]),
      ),
    );
  }
}

class _BottomSheetCleaning extends StatefulWidget {
  const _BottomSheetCleaning({
    Key? key,
    required this.timecontroller,
  }) : super(key: key);

  final TimerController timecontroller;

  @override
  State<_BottomSheetCleaning> createState() => _BottomSheetCleaningState();
}

class _BottomSheetCleaningState extends State<_BottomSheetCleaning> {
  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(24)),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/icons/location_black.png',
                    width: 15,
                  ),
                  Gap(5),
                  Text(
                    'Gwangalli Beach',
                    style: Styles.body12Text,
                  ),
                ],
              ),
              Gap(20),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Time',
                        style: Styles.body21Text
                            .copyWith(color: Styles.gray1Color),
                      ),
                      Obx(() => Text(
                            '${widget.timecontroller.hoursString.value}:${widget.timecontroller.minuteString.value}:${widget.timecontroller.secondString.value}',
                            style: Styles.number1Text,
                          ))
                    ],
                  ),
                  Gap(24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Range',
                        style: Styles.body21Text
                            .copyWith(color: Styles.gray1Color),
                      ),
                      Text(
                        '199km',
                        style: Styles.number1Text,
                      )
                    ],
                  ),
                ],
              ),
              Gap(16),
              PrimaryButton(
                  height: 60,
                  text: 'Stop Cleaning',
                  onTap: () async {
                    print(
                        '${widget.timecontroller.hoursString.value}:${widget.timecontroller.minuteString.value}:${widget.timecontroller.secondString.value}');
                    await availableCameras().then((value) => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                AfterCameraScreen(cameras: value))));
                  })
            ],
          ),
        ),
      ),
    ]);
  }
}
