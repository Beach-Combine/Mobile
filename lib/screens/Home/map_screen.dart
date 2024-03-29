import 'dart:async';

import 'package:beach_combine/controllers/map_controller.dart';
import 'package:beach_combine/screens/Home/beach_select_screen.dart';
import 'package:beach_combine/screens/Home/cleaning_screen.dart';
import 'package:beach_combine/screens/Home/before_preview_screen.dart';
import 'package:beach_combine/screens/Home/test_beach_select_screen.dart';
import 'package:beach_combine/utils/app_style.dart';
import 'package:beach_combine/widgets/black_button.dart';
import 'package:beach_combine/widgets/home_appbar.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'camera_screen.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? mapController;
  Position? currentPosition;
  Set<Marker> markers = {};
  StreamSubscription? stream;
  // LatLng(35.1532, 129.1190);

  BitmapDescriptor currentLocationIcon = BitmapDescriptor.defaultMarker;

  final locationCtrl = Get.put(MapController(), permanent: true);

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

  @override
  void initState() {
    super.initState();
    setCustomMarkerIcon();
    _getCurrentLocation();
    locationCtrl.getLocation();
    //addMarkers();
  }

  @override
  void dispose() {
    stream!.cancel();
    super.dispose();
  }

  moveCameraCurrentLocation() {
    mapController!.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(locationCtrl.currentPosition!.latitude,
          locationCtrl.currentPosition!.longitude),
      zoom: 16.5,
    )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => locationCtrl.markers.isEmpty ||
                locationCtrl.currentPosition == null
            ? Center(
                child: CircularProgressIndicator(color: Styles.primaryColor),
              )
            : Stack(children: [
                GoogleMap(
                  zoomGesturesEnabled: true,
                  zoomControlsEnabled: false,
                  myLocationButtonEnabled: true,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(locationCtrl.currentPosition!.latitude,
                        locationCtrl.currentPosition!.longitude),
                    zoom: 16.5,
                  ),
                  // initialCameraPosition: CameraPosition(
                  //   target: LatLng(
                  //       double.parse(locationCtrl.beachLocations.first.lat),
                  //       double.parse(locationCtrl.beachLocations.first.lng)),
                  //   zoom: 13,
                  // ),
                  onMapCreated: (GoogleMapController controller) {
                    mapController = controller;
                  },
                  markers: locationCtrl.markers,
                ),
                _DoubleFloatingButton(
                  controller: locationCtrl,
                  onTap: moveCameraCurrentLocation,
                ),
                HomeAppbar(),
              ])));
  }

  Future<void> _getCurrentLocation() async {
    print('현재위치 검색 시작');
    final Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    currentPosition = position;
    Get.find<MapController>().currentPosition = position;
    locationCtrl.testLatDiffer = position.latitude - 35.1535;
    locationCtrl.testLngDiffer = position.longitude - 129.1194;
    print(locationCtrl.testLatDiffer);
    print(locationCtrl.testLngDiffer);

    locationCtrl.markers.add(
      Marker(
        icon: currentLocationIcon,
        markerId: MarkerId('current_position'),
        position: LatLng(position.latitude, position.longitude),
      ),
    );
    locationCtrl.beachSelectionMarkers.add(
      Marker(
        icon: currentLocationIcon,
        markerId: MarkerId('current_position'),
        position: LatLng(position.latitude, position.longitude),
      ),
    );
    locationCtrl.trashcanSelectionMarkers.add(
      Marker(
        icon: currentLocationIcon,
        markerId: MarkerId('current_position'),
        position: LatLng(position.latitude, position.longitude),
      ),
    );
    locationCtrl.testbeachSelectionMarkers.add(
      Marker(
        icon: currentLocationIcon,
        markerId: MarkerId('current_position'),
        position: LatLng(position.latitude - locationCtrl.testLatDiffer,
            position.longitude - locationCtrl.testLngDiffer),
      ),
    );
    locationCtrl.testtrashcanSelectionMarkers.add(
      Marker(
        icon: currentLocationIcon,
        markerId: MarkerId('current_position'),
        position: LatLng(position.latitude - locationCtrl.testLatDiffer,
            position.longitude - locationCtrl.testLngDiffer),
      ),
    );

    final Stream<Position> positionStream = Geolocator.getPositionStream(
      desiredAccuracy: LocationAccuracy.high,
    );
    stream = positionStream.listen((Position position) {
      currentPosition = position;
      Get.find<MapController>().currentPosition = position;

      locationCtrl.markers
          .removeWhere((marker) => marker.markerId.value == 'current_position');
      locationCtrl.markers.add(
        Marker(
          icon: currentLocationIcon,
          markerId: MarkerId('current_position'),
          position: LatLng(position.latitude, position.longitude),
        ),
      );

      locationCtrl.beachSelectionMarkers
          .removeWhere((marker) => marker.markerId.value == 'current_position');
      locationCtrl.beachSelectionMarkers.add(
        Marker(
          icon: currentLocationIcon,
          markerId: MarkerId('current_position'),
          position: LatLng(position.latitude, position.longitude),
        ),
      );

      locationCtrl.trashcanSelectionMarkers
          .removeWhere((marker) => marker.markerId.value == 'current_position');
      locationCtrl.trashcanSelectionMarkers.add(
        Marker(
          icon: currentLocationIcon,
          markerId: MarkerId('current_position'),
          position: LatLng(position.latitude, position.longitude),
        ),
      );
      locationCtrl.testbeachSelectionMarkers
          .removeWhere((marker) => marker.markerId.value == 'current_position');
      locationCtrl.testbeachSelectionMarkers.add(
        Marker(
          icon: currentLocationIcon,
          markerId: MarkerId('current_position'),
          position: LatLng(position.latitude - locationCtrl.testLatDiffer,
              position.longitude - locationCtrl.testLngDiffer),
        ),
      );

      locationCtrl.testtrashcanSelectionMarkers
          .removeWhere((marker) => marker.markerId.value == 'current_position');
      locationCtrl.testtrashcanSelectionMarkers.add(
        Marker(
          icon: currentLocationIcon,
          markerId: MarkerId('current_position'),
          position: LatLng(position.latitude - locationCtrl.testLatDiffer,
              position.longitude - locationCtrl.testLngDiffer),
        ),
      );
    });
  }
}

class _DoubleFloatingButton extends StatelessWidget {
  final MapController controller;
  final Function()? onTap;
  const _DoubleFloatingButton({
    this.onTap,
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.end, children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                child: Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Styles.buttonPrimaryColor,
                      borderRadius: BorderRadius.circular(50)),
                  child: Center(
                    child: Text(
                      "Test",
                      style: Styles.body12Text,
                    ),
                  ),
                ),
                onTap: () async {
                  controller.isTest = true;
                  Get.to(TestBeachSelectScreen(), arguments: controller);
                },
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 20 + 182,
              )
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  GestureDetector(
                    child: Container(
                      height: 60,
                      width: 222,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                        child: Text(
                          "Start cleaning here",
                          style:
                              Styles.body12Text.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                    onTap: () async {
                      Get.to(BeachSelectScreen(), arguments: controller);
                    },
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 20,
              ),
              GestureDetector(
                onTap: onTap,
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)),
                  child: Center(
                    child: ImageIcon(
                      AssetImage("assets/icons/location.png"),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height / 10,
      )
    ]);
  }
}
