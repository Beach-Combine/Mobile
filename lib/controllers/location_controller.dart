import 'dart:math';

import 'package:beach_combine/models/beach_location.dart';
import 'package:beach_combine/services/auth_service.dart';
import 'package:beach_combine/services/location_service.dart';
import 'package:beach_combine/utils/map_manager.dart';
import 'package:beach_combine/widgets/modal_dialog.dart';
import 'package:beach_combine/widgets/trashcan_modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationController extends GetxController {
  BitmapDescriptor beachIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor trashcanIcon = BitmapDescriptor.defaultMarker;
  LatLng trashcan1 = LatLng(35.15458529236469, 129.1213574320733);
  LatLng trashcan2 = LatLng(35.1529, 129.1186);
  LatLng beach = LatLng(35.15411732197925, 129.12055697747124);
  var markers = <Marker>[].obs;
  final locationService = LocationService();
  final authService = AuthService();
  int beachId = 0;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    setCustomMarkerIcon();
  }

  Future<List<BeachLocation>> getBeachLocation() async {
    final result = await locationService.getBeachLocation();
    return result;
  }

  // @override
  // void onReady() {
  //   setMarkers();
  //   print(markers);
  // }

  List<Marker> getMarkers() {
    setMarkers();
    return markers;
  }

  Future<void> setMarkers() async {
    print('μΈνμμ');
    List<Marker> markerList = [];
    //List<BeachLocation> beachLocation = [];
    await getBeachLocation().then((beachLocation) {
      //beachLocation = value;
      if (beachLocation.isNotEmpty) {
        beachLocation.forEach((location) {
          final lat = double.parse(location.lat);
          final lng = double.parse(location.lng);
          markerList.add(Marker(
              markerId: MarkerId('beach${beachId}'),
              position: LatLng(lat, lng)));
          beachId++;
        });

        print(markerList);
      }
    });

    //List<Marker> markerList = [];

    Marker trashcanMarker = Marker(
        markerId: MarkerId('trashcan1'),
        position: trashcan1,
        icon: trashcanIcon,
        onTap: (() => Get.dialog(TrashcanModal(
              address:
                  '222, Gwanganhaebyeon-ro 54beon-gil, Suyeong-gu, Busan, Republic of Korea',
            ))));
    Marker trashcan2Marker = Marker(
        markerId: MarkerId('trashcan2'),
        position: trashcan2,
        icon: trashcanIcon,
        onTap: (() => Get.dialog(TrashcanModal(
              address:
                  '222, Gwanganhaebyeon-ro 54beon-gil, Suyeong-gu, Busan, Republic of Korea',
            ))));

    // Marker beachMarker = Marker(
    //   markerId: MarkerId('beach'),
    //   position: beach,
    //   icon: beachIcon,
    //   onTap: () => Get.dialog(ModalDialog(
    //     afterPath: 'assets/images/after.png',
    //     beforePath: 'assets/images/AdobeStock_210419020.png',
    //     date: DateTime.utc(2022, 4, 5),
    //     location: "Gwangalli Beach",
    //     imagePath: 'assets/icons/beach.png',
    //     range: 100,
    //     time: '00:59:59',
    //   )),
    // );
    markers.addAll(markerList);
  }

  Future<void> setCustomMarkerIcon() async {
    print('μ¬μ΄μ¦ μ‘°μ ');
    trashcanIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(150, 150)),
        "assets/icons/trashcan.png");

    beachIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(150, 150)),
        "assets/icons/beach.png");
    print('μ‘°μ μλ£');
  }

  // // μ΄μ  μμΉλ₯Ό μ μ₯ν  λ³μ
  // LatLng? _previousLatLng;

  // double calculateDistance(LatLng pos1, LatLng pos2) {
  //   return Geolocator.distanceBetween(
  //       pos1.latitude, pos1.longitude, pos2.latitude, pos2.longitude);
  // }

  // // μμΉκ° λ³κ²½λ  λλ§λ€ νΈμΆλλ μ½λ°± ν¨μ
  // void _onLocationChanged(LocationData locationData) {
  //   // νμ¬ μμΉ
  //   final currentLatLng =
  //       LatLng(locationData.latitude!, locationData.longitude!);

  //   // μ΄μ  μμΉμ νμ¬ μμΉ μ¬μ΄μ κ±°λ¦¬λ₯Ό κ³μ°
  //   if (_previousLatLng != null) {
  //     final distance = calculateDistance(_previousLatLng!, currentLatLng);
  //     print('μ΄λ κ±°λ¦¬: $distance m');
  //   }

  //   // νμ¬ μμΉλ₯Ό μ΄μ  μμΉλ‘ μ μ₯
  //   _previousLatLng = currentLatLng;

  //   // ...
  // }

  // ...
}
