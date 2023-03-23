import 'package:beach_combine/controllers/history_controller.dart';
import 'package:beach_combine/controllers/mine_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class HistoryMapScreen extends StatefulWidget {
  const HistoryMapScreen({super.key});

  @override
  State<HistoryMapScreen> createState() => _HistoryMapScreenState();
}

class _HistoryMapScreenState extends State<HistoryMapScreen> {
  final controller = Get.put(HistoryContorller());
  final mineController = Get.find<MineController>();
  GoogleMapController? mapController;
  LocationData? currentLocation;
  Set<Marker> markers = Set();
  static final LatLng kMapCenter = LatLng(35.3830798112092, 127.75461824125226);

  static final CameraPosition _kInitialPosition = CameraPosition(
      target: LatLng(35.3830798112092, 127.75461824125226),
      zoom: 6.7,
      tilt: 0,
      bearing: 0);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height / 12, right: 12),
        child: FloatingActionButton(
          onPressed: () {
            controller.changeRoute();
          },
          elevation: 5,
          backgroundColor: Colors.white,
          child: Image.asset(
            "assets/icons/list.png",
            width: 30,
          ),
        ),
      ),
      body: SafeArea(
          bottom: false,
          child: GoogleMap(
            myLocationEnabled: false,
            zoomGesturesEnabled: true,
            zoomControlsEnabled: false,
            myLocationButtonEnabled: false,
            initialCameraPosition: _kInitialPosition,
            markers: mineController.markerRecords,
          )),
    );
  }
}
