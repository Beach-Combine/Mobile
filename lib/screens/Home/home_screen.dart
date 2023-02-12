import 'dart:ui' as ui;

import 'package:beach_combine/screens/Home/camera_screen.dart';
import 'package:beach_combine/screens/Home/cleaning_screen.dart';
import 'package:beach_combine/screens/Home/preview_screen.dart';
import 'package:beach_combine/utils/app_style.dart';
import 'package:beach_combine/utils/map_manager.dart';
import 'package:beach_combine/widgets/home_appbar.dart';
import 'package:beach_combine/widgets/modal_dialog.dart';
import 'package:beach_combine/widgets/trashcan_modal.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GoogleMapController? mapController;
  Set<Marker> markers = Set();
  LatLng sourceLocation = LatLng(35.15371303154973, 129.11984887319667);
  LatLng destination = LatLng(35.153884196941334, 129.11847977037488);
  LatLng trashcan1 = LatLng(35.15458529236469, 129.1213574320733);
  LatLng trashcan2 = LatLng(35.15334245544671, 129.11916901035525);
  LatLng beach = LatLng(35.15411732197925, 129.12055697747124);

  @override
  void initState() {
    _addMarkers();
    super.initState();
  }

  _addMarkers() async {
    final Marker selfmarker = await MapMananger.resizeImage(
        sourceLocation, 'assets/icons/selfmarker.png', 'self', 180, (() {
      print('Clicked');
    }));

    final Marker trashcanmarker1 = await MapMananger.resizeImage(
        trashcan1,
        'assets/icons/trashcan.png',
        'trashcan1',
        100,
        () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => TrashcanModal(
                  address:
                      '222, Gwanganhaebyeon-ro 54beon-gil, Suyeong-gu, Busan, Republic of Korea',
                )));
    final Marker trashcanmarker2 = await MapMananger.resizeImage(
        trashcan2,
        'assets/icons/trashcan.png',
        'trashcan2',
        100,
        () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => TrashcanModal(
                  address:
                      '222, Gwanganhaebyeon-ro 54beon-gil, Suyeong-gu, Busan, Republic of Korea',
                )));

    final Marker beachmarker = await MapMananger.resizeImage(
        beach,
        'assets/icons/beach.png',
        'beach',
        100,
        () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => ModalDialog(
                  afterPath: 'assets/images/after.png',
                  beforePath: 'assets/images/AdobeStock_210419020.png',
                  date: DateTime.utc(2022, 4, 5),
                  location: "Gwangalli Beach",
                  imagePath: 'assets/icons/beach.png',
                  range: 100,
                  time: '00:59:59',
                )));

    setState(() {
      markers.add(selfmarker);
      markers.add(trashcanmarker1);
      markers.add(beachmarker);
      markers.add(trashcanmarker2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          body: Stack(children: [
            GoogleMap(
              zoomGesturesEnabled: true,
              zoomControlsEnabled: false,
              myLocationButtonEnabled: true,
              initialCameraPosition:
                  CameraPosition(target: sourceLocation, zoom: 16.5),
              markers: markers,
            ),
            _DoubleFloatingButton(),
            HomeAppbar(),
          ]),
        ),
      ),
    );
  }
}

class _DoubleFloatingButton extends StatelessWidget {
  const _DoubleFloatingButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.end, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            child: Container(
              height: 60,
              width: 222,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(50)),
              child: Center(
                child: Text(
                  "Start cleaning here",
                  style: Styles.body12Text.copyWith(color: Colors.white),
                ),
              ),
            ),
            onTap: () async {
              await availableCameras().then((value) => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => CameraScreen(
                            cameras: value,
                            onPressed: () {
                              Get.to(PreviewScreen(
                                imagePath: "assets/images/beforepic.png",
                                onTap: () {
                                  Get.offAll(CleaningScreen());
                                },
                              ));
                            },
                          ))));
            },
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 20,
          ),
          GestureDetector(
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100)),
              child: Center(
                child: ImageIcon(
                  AssetImage("assets/icons/location.png"),
                ),
              ),
            ),
          ),
        ],
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height / 8,
      )
    ]);
  }
}
