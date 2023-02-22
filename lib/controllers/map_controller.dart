// import 'package:beach_combine/data.dart';
// import 'package:beach_combine/services/location_service.dart';
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// import 'package:get/get.dart';

// class MapController extends GetxController {
//   final mapService = MapService();
//   var currentPosition = Position(
//     longitude: 0,
//     latitude: 0,
//     timestamp: DateTime.now(),
//     accuracy: 0,
//     altitude: 0,
//     heading: 0,
//     speed: 0,
//     speedAccuracy: 0,
//   ).obs;
//   var beachName = ''.obs;

//   late GoogleMapController mapController;
//   Set<Marker> markers = {};

//   @override
//   void onInit() {
//     super.onInit();
//     _getCurrentLocation();
//   }

//   Future<void> _getCurrentLocation() async {
//     final Position position = await Geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.high,
//     );
//     currentPosition.value = position;

//     markers.add(
//       Marker(
//         markerId: MarkerId('current_position'),
//         position: LatLng(position.latitude, position.longitude),
//       ),
//     );

//     final Stream<Position> positionStream = Geolocator.getPositionStream();
//     positionStream.listen((Position position) {
//       currentPosition.value = position;

//       markers
//           .removeWhere((marker) => marker.markerId.value == 'current_position');
//       markers.add(
//         Marker(
//           markerId: MarkerId('current_position'),
//           position: LatLng(position.latitude, position.longitude),
//         ),
//       );

//       _getBeachName(position.latitude, position.longitude);
//     });
//   }

//   Future<void> _getBeachName(double lat, double lng) async {
//     final apiKey = ANDROID_MAP_KEY;
//     final url =
//         'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$apiKey';
//     final response = await http.get(Uri.parse(url));
//     final decodedResponse = json.decode(response.body);

//     for (var result in decodedResponse['results']) {
//       for (var address in result['address_components']) {
//         if (address['types'][0] == 'natural_feature') {
//           beachName.value = address['long_name'];
//           return;
//         }
//       }
//     }

//     beachName.value = '';
//   }

//   Widget buildMap() {
//     return GoogleMap(
//       initialCameraPosition: CameraPosition(
//         target: LatLng(37.5665, 126.9780),
//         zoom: 15,
//       ),
//       onMapCreated: (GoogleMapController controller) {
//         mapController = controller;
//       },
//       markers: markers,
//     );
//   }

//   Future<bool> getBeachLocation() async {
//     final result = await mapService.getBeachLocation();
//     return result;
//   }
// }
