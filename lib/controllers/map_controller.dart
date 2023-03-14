import 'dart:math';

import 'package:beach_combine/models/Beach_Info/beach_info.dart';
import 'package:beach_combine/models/beach_location.dart';
import 'package:beach_combine/models/trashcan_location.dart';
import 'package:beach_combine/services/location_service.dart';
import 'package:beach_combine/widgets/beach_select_bottom_sheet.dart';
import 'package:beach_combine/widgets/modal_dialog.dart';
import 'package:beach_combine/widgets/not_cleaned_modal.dart';
import 'package:beach_combine/widgets/trashcan_modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:custom_marker/marker_icon.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';

class MapController extends GetxController {
  List<BeachLocation> beachLocations = <BeachLocation>[].obs;
  List<TrashcanLocation> trashcanLocations = <TrashcanLocation>[].obs;
  var markers = RxSet<Marker>();
  var beachSelectionMarkers = RxSet<Marker>();
  var isLoading = false.obs;
  LocationService locationService = LocationService();
  Position? currentPosition;
  int selectedBeach = 0;

  setSelectedBeach(int id) {
    selectedBeach = id;
  }

  getLocation() async {
    final beaches = await locationService.getBeachLocation();
    final trashcans = await locationService.getTrashcanLocation();
    beachLocations.addAll(beaches);
    trashcanLocations.addAll(trashcans);
    print(beaches);
    print(trashcans);
    createMarkers();
  }

  createMarkers({
    bool onlyBeachs = false,
    bool onlyTrashcans = false,
  }) {
    if (onlyBeachs == false) {
      trashcanLocations.forEach((element) async {
        //http.Response response = await http.get(Uri.parse(element.image));
        markers.add(
          Marker(
              markerId: MarkerId('trashcan${element.id.toString()}'),
              icon: await MarkerIcon.pictureAsset(
                  assetPath: "assets/icons/trashcan.png",
                  width: 100,
                  height: 100),
              position: LatLng(
                double.parse(element.lat),
                double.parse(element.lng),
              ),
              onTap: (() {
                Get.dialog(TrashcanModal(address: element.address));
              })),
        );
      });
    }
    if (onlyTrashcans == false) {
      beachLocations.forEach((element) async {
        print(element.image);
        final beachInfo = await getBeachInfo(element.id);

        markers.add(
          Marker(
              markerId: MarkerId('${element.id}'),
              icon: beachInfo!.record == null
                  ? await MarkerIcon.pictureAsset(
                      assetPath: "assets/icons/not_cleaned.png",
                      width: 100,
                      height: 100)
                  : await MarkerIcon.pictureAsset(
                      assetPath: "assets/icons/beach.png",
                      width: 150,
                      height: 150),
              position: LatLng(
                double.parse(element.lat),
                double.parse(element.lng),
              ),
              onTap: () {
                if (beachInfo.record == null) {
                  Get.dialog(NotCleanedModal());
                } else {
                  Get.dialog(ModalDialog(
                    afterPath: 'assets/images/after.png',
                    beforePath: 'assets/images/AdobeStock_210419020.png',
                    date: DateTime.utc(2022, 4, 5),
                    location: beachInfo.beach.name,
                    imagePath: 'assets/icons/beach.png',
                    range: 100,
                    time: '00:59:59',
                  ));
                }
              }),
        );

        beachSelectionMarkers.add(Marker(
          markerId: MarkerId(element.id.toString()),
          icon: beachInfo.record == null
              ? await MarkerIcon.pictureAsset(
                  assetPath: "assets/icons/not_cleaned.png",
                  width: 100,
                  height: 100)
              : await MarkerIcon.pictureAsset(
                  assetPath: "assets/icons/beach.png", width: 150, height: 150),
          position: LatLng(
            double.parse(element.lat),
            double.parse(element.lng),
          ),
          onTap: () => Get.bottomSheet(
              barrierColor: Colors.transparent,
              BeachSelectBottomSheet(
                  name: beachInfo.beach.name,
                  lat: currentPosition!.latitude,
                  lng: currentPosition!.longitude,
                  id: element.id)),
        ));
      });
    }
  }

  Future<BeachInfo?> getBeachInfo(int id) async {
    final result = await locationService.getBeachInfo(id);
    return result;
  }

  Future<bool> checkBeachRange(double lat, double lng, int id) async {
    final result = locationService.checkBeachRange(lat, lng, id);
    return result;
  }
}
