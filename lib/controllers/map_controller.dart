import 'dart:math';

import 'package:beach_combine/models/beach_location.dart';
import 'package:beach_combine/models/trashcan_location.dart';
import 'package:beach_combine/services/location_service.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:custom_marker/marker_icon.dart';
import 'package:http/http.dart' as http;

class MapController extends GetxController {
  List<BeachLocation> beachLocations = <BeachLocation>[].obs;
  List<TrashcanLocation> trashcanLocations = <TrashcanLocation>[].obs;
  var markers = RxSet<Marker>();
  var isLoading = false.obs;
  LocationService locationService = LocationService();

  getLocation() async {
    final beaches = await locationService.getBeachLocation();
    final trashcans = await locationService.getTrashcanLocation();
    beachLocations.addAll(beaches);
    trashcanLocations.addAll(trashcans);
    print(beaches);
    print(trashcans);
    // locations.addAll(trashcans);
    // print(locations);
    createMarkers();
  }

  getTrashcanLocation() async {}

  createMarkers() {
    beachLocations.forEach((element) async {
      //http.Response response = await http.get(Uri.parse(element.image));
      markers.add(
        Marker(
          markerId: MarkerId(element.id.toString()),
          icon: await MarkerIcon.pictureAsset(
              assetPath: "assets/icons/beach.png", width: 150, height: 150),
          position: LatLng(
            double.parse(element.lat),
            double.parse(element.lng),
          ),
        ),
      );
    });

    trashcanLocations.forEach((element) async {
      //http.Response response = await http.get(Uri.parse(element.image));
      markers.add(
        Marker(
          markerId: MarkerId('trashcan${element.id.toString()}'),
          icon: await MarkerIcon.pictureAsset(
              assetPath: "assets/icons/trashcan.png", width: 130, height: 130),
          position: LatLng(
            double.parse(element.lat),
            double.parse(element.lng),
          ),
        ),
      );
    });
  }
}
