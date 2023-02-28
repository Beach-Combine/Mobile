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
    print('세팅시작');
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
    print('사이즈 조절');
    trashcanIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(150, 150)),
        "assets/icons/trashcan.png");

    beachIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(150, 150)),
        "assets/icons/beach.png");
    print('조절완료');
  }

  // // 이전 위치를 저장할 변수
  // LatLng? _previousLatLng;

  // double calculateDistance(LatLng pos1, LatLng pos2) {
  //   return Geolocator.distanceBetween(
  //       pos1.latitude, pos1.longitude, pos2.latitude, pos2.longitude);
  // }

  // // 위치가 변경될 때마다 호출되는 콜백 함수
  // void _onLocationChanged(LocationData locationData) {
  //   // 현재 위치
  //   final currentLatLng =
  //       LatLng(locationData.latitude!, locationData.longitude!);

  //   // 이전 위치와 현재 위치 사이의 거리를 계산
  //   if (_previousLatLng != null) {
  //     final distance = calculateDistance(_previousLatLng!, currentLatLng);
  //     print('이동 거리: $distance m');
  //   }

  //   // 현재 위치를 이전 위치로 저장
  //   _previousLatLng = currentLatLng;

  //   // ...
  // }

  // ...
}
