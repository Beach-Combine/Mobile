import 'dart:async';

import 'package:beach_combine/controllers/map_controller.dart';
import 'package:beach_combine/utils/app_style.dart';
import 'package:beach_combine/widgets/home_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:custom_marker/marker_icon.dart';

class BeachSelectScreen extends StatefulWidget {
  const BeachSelectScreen({super.key});

  @override
  State<BeachSelectScreen> createState() => _BeachSelectScreenState();
}

class _BeachSelectScreenState extends State<BeachSelectScreen> {
  GoogleMapController? mapController;
  Position? currentPosition;
  StreamSubscription? stream;
  Set<Marker> markers = {};
  final controller = Get.arguments;

  @override
  void initState() {
    print(controller.markers);

    // TODO: implement initState
  }

  Set<Marker> getMarkers() {
    controller.markers.forEach((marker) {
      if (!marker.markerId.value.contains('trashcan')) {
        markers.add(marker);
      }
    });
    return markers;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              CupertinoIcons.back,
              color: Colors.black,
            ),
            onPressed: () => Get.back(),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: Obx(() => controller.markers.isEmpty
            ? Center(
                child: CircularProgressIndicator(color: Styles.primaryColor),
              )
            : Stack(children: [
                GoogleMap(
                  zoomGesturesEnabled: true,
                  zoomControlsEnabled: false,
                  myLocationButtonEnabled: true,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(controller.currentPosition.latitude,
                        controller.currentPosition.longitude),
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
                  markers: getMarkers(),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HomeAppbar(),
                    Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Text(
                        'Please select\na beach to clean.',
                        style: Styles.titleText,
                      ),
                    ),
                  ],
                ),
              ])));
  }
}
