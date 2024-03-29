import 'dart:async';

import 'package:beach_combine/common/beach_combine.dart';
import 'package:beach_combine/controllers/map_controller.dart';
import 'package:beach_combine/screens/Home/report_camera_screen.dart';
import 'package:beach_combine/utils/app_style.dart';
import 'package:beach_combine/widgets/black_button.dart';
import 'package:beach_combine/widgets/home_appbar.dart';
import 'package:beach_combine/widgets/notice_modal.dart';
import 'package:beach_combine/widgets/seperate_here_bottom_sheet.dart';
import 'package:camera/camera.dart';
import 'package:custom_marker/marker_icon.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class TestSeperateTrashScreen extends StatefulWidget {
  TestSeperateTrashScreen({super.key});

  @override
  State<TestSeperateTrashScreen> createState() =>
      _TestSeperateTrashScreenState();
}

class _TestSeperateTrashScreenState extends State<TestSeperateTrashScreen> {
  GoogleMapController? mapController;
  Position? currentPosition;
  Set<Marker> markers = {};
  StreamSubscription? stream;
  BitmapDescriptor currentLocationIcon = BitmapDescriptor.defaultMarker;

  final controller = Get.find<MapController>();
  //final controller = Get.put(MapController());

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    setCustomMarkerIcon();
    controller.getLocation();
    getMarkers();
    //addMarkers();
  }

  @override
  void dispose() {
    stream!.cancel();
    super.dispose();
  }

  Set<Marker> getMarkers() {
    controller.testtrashcanSelectionMarkers.forEach((marker) {
      if (marker.markerId.value.contains('trashcan') ||
          marker.markerId.value.contains('current_position')) {
        markers.add(marker);
      }
    });
    return markers;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
          () => controller.markers.isEmpty || controller.currentPosition == null
              ? Center(
                  child: CircularProgressIndicator(color: Styles.primaryColor),
                )
              : Stack(children: [
                  GoogleMap(
                    zoomGesturesEnabled: true,
                    zoomControlsEnabled: false,
                    myLocationButtonEnabled: true,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(
                          controller.currentPosition!.latitude -
                              controller.testLatDiffer,
                          controller.currentPosition!.longitude -
                              controller.testLngDiffer),
                      zoom: 16.5,
                    ),
                    onMapCreated: (GoogleMapController controller) {
                      mapController = controller;
                    },
                    markers: controller.testtrashcanSelectionMarkers,
                  ),
                  _SaparateHereAndReportPanel(),
                  Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: GestureDetector(
                        onTap: () => Get.offAll(BeachCombine()),
                        child: Container(
                          width: 220,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(50)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/icons/back_home.png',
                                width: 20,
                              ),
                              Gap(8),
                              Text(
                                'Stop and go home',
                                style: Styles.body22Text
                                    .copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ])),
    );
  }

  Future<void> _getCurrentLocation() async {
    print('현재위치 검색 시작');
    final Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    currentPosition = position;
    Get.find<MapController>().currentPosition = position;

    controller.markers.add(
      Marker(
        icon: currentLocationIcon,
        markerId: MarkerId('current_position'),
        position: LatLng(position.latitude - controller.testLatDiffer,
            position.longitude - controller.testLngDiffer),
      ),
    );
    controller.testbeachSelectionMarkers.add(
      Marker(
        icon: currentLocationIcon,
        markerId: MarkerId('current_position'),
        position: LatLng(position.latitude - controller.testLatDiffer,
            position.longitude - controller.testLngDiffer),
      ),
    );

    final Stream<Position> positionStream = Geolocator.getPositionStream(
      desiredAccuracy: LocationAccuracy.high,
    );
    stream = positionStream.listen((Position position) {
      currentPosition = position;
      Get.find<MapController>().currentPosition = position;

      controller.markers
          .removeWhere((marker) => marker.markerId.value == 'current_position');
      controller.markers.add(
        Marker(
          icon: currentLocationIcon,
          markerId: MarkerId('current_position'),
          position: LatLng(position.latitude - controller.testLatDiffer,
              position.longitude - controller.testLngDiffer),
        ),
      );

      controller.testbeachSelectionMarkers
          .removeWhere((marker) => marker.markerId.value == 'current_position');
      controller.testtrashcanSelectionMarkers.add(
        Marker(
          icon: currentLocationIcon,
          markerId: MarkerId('current_position'),
          position: LatLng(position.latitude - controller.testLatDiffer,
              position.longitude - controller.testLngDiffer),
        ),
      );
    });
  }

  Future<void> setCustomMarkerIcon() async {
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(), "assets/icons/current_location.png")
        .then(
      (icon) {
        setState(() {
          currentLocationIcon = icon;
        });
      },
    );
  }
}

class _SaparateHereAndReportPanel extends StatelessWidget {
  _SaparateHereAndReportPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      controller: Get.find<MapController>().pc,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24), topRight: Radius.circular(24)),
      maxHeight: 250,
      minHeight: 35,
      defaultPanelState: PanelState.OPEN,
      panel: Container(
        width: double.infinity,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 24, right: 24, bottom: 24, top: 8),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Styles.gray2Color,
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                height: 4,
                width: 40,
              ),
              Gap(30),
              Text(
                'Please select the icon\nfor seperate the trash',
                style: Styles.titleText,
              ),
              TextButton(
                onPressed: () async {
                  Get.find<MapController>().pc.close();
                  await Get.dialog(NoticeModal(onTap: () => Get.back()));
                  Get.find<MapController>().pc.open();
                },
                child: Text(
                  'if the trash can is not registered on the map?',
                  style: Styles.body3Text.copyWith(
                    color: Styles.gray1Color,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              Gap(10),
              BlackButton(
                  height: 60,
                  text: 'Saparate the trash here and report it',
                  onTap: () async {
                    await availableCameras().then((value) => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => ReportCameraScreen(
                                  cameras: value,
                                  isTest: true,
                                ))));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
