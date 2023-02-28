// import 'package:beach_combine/controllers/map_controller.dart';
// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class MapTestScreen extends StatefulWidget {
//   const MapTestScreen({super.key});

//   @override
//   State<MapTestScreen> createState() => _MapTestScreenState();
// }

// class _MapTestScreenState extends State<MapTestScreen> {
//   MapController mapController = Get.put(MapController());

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     mapController.getLocation();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//           child: Obx(() => mapController.beachLocations.isNotEmpty
//               ? GoogleMap(
//                   initialCameraPosition: CameraPosition(
//                     target: LatLng(
//                         double.parse(mapController.beachLocations.first.lat),
//                         double.parse(mapController.beachLocations.first.lng)),
//                     zoom: 13,
//                   ),
//                   markers: mapController.markers,
//                 )
//               : Center(
//                   child: CircularProgressIndicator(),
//                 ))),
//     );
//   }
// }
