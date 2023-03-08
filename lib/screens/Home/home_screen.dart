import 'dart:async';

import 'package:beach_combine/controllers/location_controller.dart';
import 'package:beach_combine/screens/Home/camera_screen.dart';
import 'package:beach_combine/screens/Home/cleaning_screen.dart';
import 'package:beach_combine/screens/Home/preview_screen.dart';
import 'package:beach_combine/utils/app_style.dart';
import 'package:beach_combine/utils/map_manager.dart';
import 'package:beach_combine/widgets/home_appbar.dart';
import 'package:beach_combine/widgets/trashcan_modal.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  Set<Marker> markers = Set();
  LatLng destination = LatLng(35.153884196941334, 129.11847977037488);
  LatLng trashcan1 = LatLng(35.15458529236469, 129.1213574320733);
  LatLng trashcan2 = LatLng(35.15334245544671, 129.11916901035525);
  LatLng beach = LatLng(35.15411732197925, 129.12055697747124);
  LocationData? currentLocation;
  BitmapDescriptor beachIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor trashcanIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor currentLocationIcon = BitmapDescriptor.defaultMarker;
  void setCustomMarkerIcon() async {
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, "assets/icons/beach.png")
        .then(
      (icon) {
        beachIcon = icon;
      },
    );
    await MapMananger.resizedIcon("assets/icons/selfmarker.png", 180)
        .then((icon) {
      currentLocationIcon = icon;
    });
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, 'assets/icons/trashcan.png')
        .then(
      (icon) {
        trashcanIcon = icon;
      },
    );
    // BitmapDescriptor.fromAssetImage(
    //         ImageConfiguration.empty, "assets/icons/selfmarker.png")
    //     .then(
    //   (icon) {
    //     currentLocationIcon = icon;
    //   },
    // );
  }

  void getCurrentLocation() async {
    Location location = Location();

    location.getLocation().then((location) {
      setState(() {
        currentLocation = location;
        markers.add(Marker(
          markerId: MarkerId('cur'),
          icon: currentLocationIcon,
          position:
              LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
        ));
      });
    });

    GoogleMapController googleMapController = await _controller.future;

    location.onLocationChanged.listen(
      (newLoc) {
        // googleMapController.animateCamera(CameraUpdate.newCameraPosition(
        //     CameraPosition(
        //         zoom: 16.5,
        //         target: LatLng(newLoc.latitude!, newLoc.longitude!))));
        setState(() {
          currentLocation = newLoc;
          markers.add(Marker(
            markerId: MarkerId('cur'),
            icon: currentLocationIcon,
            position:
                LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
          ));
        });
      },
    );
  }

  @override
  void initState() {
    getCurrentLocation();
    _addMarkers();
    setCustomMarkerIcon();
    super.initState();
  }

  _addMarkers() async {
    // final Marker selfmarker = await MapMananger.resizeImage(
    //     LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
    //     'assets/icons/selfmarker.png',
    //     'self',
    //     180, (() {
    //   print('Clicked');
    // }));
    // final Marker currentMarker = Marker(
    //     markerId: MarkerId('currentLocation'),
    //     position:
    //         LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
    //     icon: currentLocationIcon);
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

    // final Marker beachmarker = await MapMananger.resizeImage(
    //     beach,
    //     'assets/icons/beach.png',
    //     'beach',
    //     100,
    //     () => showDialog<String>(
    //         context: context,
    //         builder: (BuildContext context) => ModalDialog(
    //               afterPath: 'assets/images/after.png',
    //               beforePath: 'assets/images/AdobeStock_210419020.png',
    //               date: DateTime.utc(2022, 4, 5),
    //               location: "Gwangalli Beach",
    //               imagePath: 'assets/icons/beach.png',
    //               range: 100,
    //               time: '00:59:59',
    //             )));
    setState(() {
      //markers.add(selfmarker);
      markers.add(trashcanmarker1);
      // markers.add(beachmarker);
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
          body: currentLocation == null
              ? Center(
                  child: Text('Loading'),
                )
              : Stack(children: [
                  GoogleMap(
                    zoomGesturesEnabled: true,
                    zoomControlsEnabled: false,
                    myLocationButtonEnabled: true,
                    initialCameraPosition: CameraPosition(
                        target: LatLng(currentLocation!.latitude!,
                            currentLocation!.longitude!),
                        zoom: 16.5),
                    markers: markers,
                    // markers: {
                    //   Marker(
                    //       markerId: MarkerId('currentLocation'),
                    //       position: LatLng(currentLocation!.latitude!,
                    //           currentLocation!.longitude!),
                    //       icon: currentLocationIcon),
                    //   markers.single
                    // },
                    onMapCreated: (controller) {
                      _controller.complete(controller);
                    },
                    // onCameraIdle: () async {
                    //   final GoogleMapController controller =
                    //       await _controller.future;
                    //   final LatLngBounds bounds =
                    //       await controller.getVisibleRegion();
                    //   print(bounds);
                    //   // 서버로 bounds 정보를 전달하고, 해당 bounds 내에 있는 마커 데이터를 받아와 _markers 리스트에 추가하는 작업 수행
                    //   // ...
                    // },
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
                              // Get.to(PreviewScreen(
                              //   imagePath: "assets/images/beforepic.png",
                              //   onTap: () {
                              //     Get.offAll(CleaningScreen());
                              //   },
                              // ));
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
        height: MediaQuery.of(context).size.height / 10,
      )
    ]);
  }
}
