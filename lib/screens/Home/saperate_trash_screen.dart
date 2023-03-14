import 'dart:async';

import 'package:beach_combine/controllers/map_controller.dart';
import 'package:beach_combine/utils/app_style.dart';
import 'package:beach_combine/widgets/home_appbar.dart';
import 'package:beach_combine/widgets/notice_modal.dart';
import 'package:beach_combine/widgets/seperate_here_bottom_sheet.dart';
import 'package:custom_marker/marker_icon.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';

class SeperateTrashScreen extends StatefulWidget {
  SeperateTrashScreen({super.key});

  @override
  State<SeperateTrashScreen> createState() => _SeperateTrashScreenState();
}

class _SeperateTrashScreenState extends State<SeperateTrashScreen> {
  GoogleMapController? mapController;
  Position? currentPosition;
  Set<Marker> markers = {};
  StreamSubscription? stream;
  BitmapDescriptor currentLocationIcon = BitmapDescriptor.defaultMarker;

  final controller = Get.find<MapController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _showBottomSheet());
    _getCurrentLocation();
    setCustomMarkerIcon();
    controller.getLocation();
    getMarkers();
    //addMarkers();
  }

  _showBottomSheet() {
    showModalBottomSheet(
        barrierColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        context: context,
        builder: (context) {
          return SeparateHereBottomSheet(
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
  void dispose() {
    stream!.cancel();
    super.dispose();
  }

  Set<Marker> getMarkers() {
    controller.markers.forEach((marker) {
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
        body: Obx(() => controller.markers.isEmpty ||
                controller.currentPosition == null
            ? Center(
                child: CircularProgressIndicator(color: Styles.primaryColor),
              )
            : Stack(children: [
                GoogleMap(
                  zoomGesturesEnabled: true,
                  zoomControlsEnabled: false,
                  myLocationButtonEnabled: true,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(controller.currentPosition!.latitude,
                        controller.currentPosition!.longitude),
                    zoom: 16.5,
                  ),
                  onMapCreated: (GoogleMapController controller) {
                    mapController = controller;
                  },
                  markers: markers,
                ),
              ])));
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
        position: LatLng(position.latitude, position.longitude),
      ),
    );
    controller.beachSelectionMarkers.add(
      Marker(
        icon: currentLocationIcon,
        markerId: MarkerId('current_position'),
        position: LatLng(position.latitude, position.longitude),
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
          position: LatLng(position.latitude, position.longitude),
        ),
      );

      controller.beachSelectionMarkers
          .removeWhere((marker) => marker.markerId.value == 'current_position');
      controller.beachSelectionMarkers.add(
        Marker(
          icon: currentLocationIcon,
          markerId: MarkerId('current_position'),
          position: LatLng(position.latitude, position.longitude),
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
