import 'dart:async';

import 'package:beach_combine/controllers/map_controller.dart';
import 'package:beach_combine/screens/Home/camera_screen.dart';
import 'package:beach_combine/screens/Home/preview_screen.dart';
import 'package:beach_combine/screens/Home/reward_screen.dart';
import 'package:beach_combine/utils/app_style.dart';
import 'package:beach_combine/utils/map_manager.dart';
import 'package:beach_combine/widgets/black_button.dart';
import 'package:beach_combine/widgets/notice_modal.dart';
import 'package:beach_combine/widgets/primary_button.dart';
import 'package:camera/camera.dart';
import 'package:custom_marker/marker_icon.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class NearbyTrashcanScreen extends StatefulWidget {
  const NearbyTrashcanScreen({super.key});

  @override
  State<NearbyTrashcanScreen> createState() => _NearbyTrashcanScreenState();
}

class _NearbyTrashcanScreenState extends State<NearbyTrashcanScreen> {
  GoogleMapController? mapController;
  Set<Marker> markers = Set();
  Position? currentPosition;
  StreamSubscription? stream;
  LatLng sourceLocation = LatLng(35.15371303154973, 129.11984887319667);
  LatLng destination = LatLng(35.153884196941334, 129.11847977037488);
  LatLng trashcan1 = LatLng(35.15458529236469, 129.1213574320733);
  LatLng trashcan2 = LatLng(35.15334245544671, 129.11916901035525);
  LatLng beach = LatLng(35.15411732197925, 129.12055697747124);
  final locationCtrl = Get.put(MapController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => _showBottomSheet());
    _getCurrentLocation();
    locationCtrl.getLocation();
    super.initState();
  }

  _showBottomSheet() {
    showModalBottomSheet(
        barrierColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        context: context,
        builder: (context) {
          return _SeparateBottomSheet(
            onPressed: () {
              Get.back();
              showDialog<String>(
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) => NoticeModal(
                        onTap: () {
                          Get.back();
                          _showBottomSheet();
                        },
                      ));
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => locationCtrl.markers.isEmpty
            ? Center(
                child: CircularProgressIndicator(color: Styles.primaryColor),
              )
            : Stack(children: [
                GoogleMap(
                  zoomGesturesEnabled: true,
                  zoomControlsEnabled: false,
                  myLocationButtonEnabled: true,
                  initialCameraPosition:
                      CameraPosition(target: sourceLocation, zoom: 16.5),
                  markers: locationCtrl.markers,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: TextButton(
                    child: Text('asdf'),
                    onPressed: () {
                      _showBottomSheet();
                    },
                  ),
                ),
              ])));
  }

  Future<void> _getCurrentLocation() async {
    print('현재위치 검색 시작');
    final Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    currentPosition = position;
    locationCtrl.markers.add(
      Marker(
        icon: await MarkerIcon.pictureAsset(
            assetPath: 'assets/icons/selfmarker.png', width: 150, height: 150),
        markerId: MarkerId('current_position'),
        position: LatLng(position.latitude, position.longitude),
      ),
    );

    final Stream<Position> positionStream = Geolocator.getPositionStream(
      desiredAccuracy: LocationAccuracy.high,
    );
    stream = positionStream.listen((Position position) async {
      currentPosition = position;
      locationCtrl.markers
          .removeWhere((marker) => marker.markerId.value == 'current_position');
      locationCtrl.markers.add(
        Marker(
          icon: await MarkerIcon.pictureAsset(
              assetPath: 'assets/icons/selfmarker.png',
              width: 150,
              height: 150),
          markerId: MarkerId('current_position'),
          position: LatLng(position.latitude, position.longitude),
        ),
      );
    });
  }
}

class _DiscoverBottomSheet extends StatelessWidget {
  const _DiscoverBottomSheet({
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
                'assets/images/trashcan.png',
                width: 26,
              ),
              Gap(5),
              Text(
                'You found a trash can!',
                style: Styles.body21Text,
              ),
              Text(
                'Please separate the trash',
                style: Styles.titleText,
              ),
              Gap(40),
              PrimaryButton(
                  height: 60,
                  text: 'Saparate the trash here',
                  onTap: () async {
                    Get.offAll(RewardScreen(
                      isDifferentArea: false,
                      location: 'Gwangalli Beach',
                    ));
                  })
            ],
          ),
        ),
      ),
    ]);
  }
}

class _SeparateBottomSheet extends StatelessWidget {
  final onPressed;
  const _SeparateBottomSheet({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Wrap(children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24), topRight: Radius.circular(24))),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 24, right: 24, bottom: 24, top: 14),
            child: Column(
              children: [
                TextButton(
                  onPressed: onPressed,
                  child: Text(
                    'if the trash can is not registered on the map?',
                    style: Styles.body3Text.copyWith(
                      color: Styles.gray1Color,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                BlackButton(
                    height: 60,
                    text: 'Saparate the trash here and report it',
                    onTap: () async {
                      await availableCameras().then((value) => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => CameraScreen(
                                    cameras: value,
                                    onPressed: () {
                                      // Get.to(PreviewScreen(
                                      //   imagePath:
                                      //       "assets/images/trashcan_location.png",
                                      //   onTap: () {
                                      //     Get.offAll(RewardScreen(
                                      //       isDifferentArea: true,
                                      //       location: 'Gwangalli Beach',
                                      //     ));
                                      //   },
                                      // ));
                                    },
                                  ))));
                    })
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
