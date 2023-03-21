import 'package:beach_combine/controllers/history_controller.dart';
import 'package:beach_combine/controllers/map_controller.dart';
import 'package:beach_combine/controllers/mine_controller.dart';
import 'package:beach_combine/models/record.dart';
import 'package:beach_combine/screens/Mine/history_list_screen.dart';
import 'package:beach_combine/utils/map_manager.dart';
import 'package:beach_combine/widgets/history_modal_dialog.dart';
import 'package:beach_combine/widgets/modal_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
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

  final records = [
    Record(
        beachId: 0,
        isWritten: false,
        time: '300',
        recordId: 0,
        date: DateTime.now(),
        afterImage: 'assets/images/after.png',
        range: 100,
        beforeImage: 'assets/images/AdobeStock_210419020.png'),
    Record(
        beachId: 1,
        isWritten: false,
        time: '300',
        recordId: 1,
        date: DateTime.now(),
        afterImage: 'assets/images/after.png',
        range: 100,
        beforeImage: 'assets/images/AdobeStock_210419020.png')
  ];

  static final CameraPosition _kInitialPosition = CameraPosition(
      target: LatLng(35.3830798112092, 127.75461824125226),
      zoom: 6.7,
      tilt: 0,
      bearing: 0);

  @override
  void initState() {
    // _addMarkers();
    super.initState();
  }

  // _addMarkers() async {
  //   // Position position = await Geolocator.getCurrentPosition(
  //   //     desiredAccuracy: LocationAccuracy.high);
  //   // final LatLng currentLocation =
  //   //     LatLng(position.latitude, position.longitude);
  //   // print(currentLocation);

  //   setState(() {
  //     markers.add(Marker(
  //         markerId: MarkerId("mylocation"),
  //         draggable: true,
  //         onTap: () {
  //           Get.find<MineController>().getMarkerRecords();
  //           Get.dialog(HistoryModalDialog(records: records));
  //         },
  //         position: LatLng(35.1539, 129.1203)));
  //   });

  //   for (int i = 0; i < myBadgeList.length; i++) {
  //     final Marker marker = await MapMananger.resizeImage(
  //         myBadgeList[i],
  //         'assets/icons/badge.png',
  //         'self$i',
  //         100,
  //         (() => showDialog<String>(
  //             context: context,
  //             builder: (BuildContext context) => ModalDialog(
  //                   afterPath: 'assets/images/after.png',
  //                   beforePath: 'assets/images/AdobeStock_210419020.png',
  //                   date: DateTime.utc(2022, 4, 5).toString(),
  //                   location: "Gwangalli Beach",
  //                   imagePath: 'assets/icons/badge_ver2.png',
  //                   range: 100,
  //                   time: '00:59:59',
  //                 ))));

  //     setState(() {
  //       markers.add(marker);
  //     });
  //   }
  // }

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
