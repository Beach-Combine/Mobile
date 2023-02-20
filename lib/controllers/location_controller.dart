import 'package:beach_combine/utils/map_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationController extends GetxController {
  BitmapDescriptor beachIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor trashcanIcon = BitmapDescriptor.defaultMarker;
  LatLng trashcan1 = LatLng(35.15458529236469, 129.1213574320733);
  LatLng trashcan2 = LatLng(35.15334245544671, 129.11916901035525);
  LatLng beach = LatLng(35.15411732197925, 129.12055697747124);
  List<Marker> markers = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    setCustomMarkerIcon();
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
    Marker trashcanMarker = Marker(
        markerId: MarkerId('trashcan1'),
        position: trashcan1,
        icon: trashcanIcon);
    Marker beachMarker =
        Marker(markerId: MarkerId('beach'), position: beach, icon: beachIcon);
    markers.addAll([trashcanMarker, beachMarker]);
  }

  Future<void> setCustomMarkerIcon() async {
    print('사이즈 조절');
    trashcanIcon =
        await MapMananger.resizedIcon('assets/icons/trashcan.png', 130);

    beachIcon = await MapMananger.resizedIcon('assets/icons/beach.png', 140);
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
