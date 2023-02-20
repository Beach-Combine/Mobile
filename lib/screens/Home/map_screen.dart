import 'dart:async';

import 'package:beach_combine/controllers/location_controller.dart';
import 'package:beach_combine/screens/Home/cleaning_screen.dart';
import 'package:beach_combine/screens/Home/preview_screen.dart';
import 'package:beach_combine/utils/app_style.dart';
import 'package:beach_combine/utils/map_manager.dart';
import 'package:beach_combine/widgets/home_appbar.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'camera_screen.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? mapController;
  Position? currentPosition;
  Set<Marker> markers = {};
  LatLng destination = LatLng(35.153884196941334, 129.11847977037488);
  LatLng trashcan1 = LatLng(35.15458529236469, 129.1213574320733);
  LatLng trashcan2 = LatLng(35.15334245544671, 129.11916901035525);
  LatLng beach = LatLng(35.15411732197925, 129.12055697747124);
  StreamSubscription? stream;

  BitmapDescriptor currentLocationIcon = BitmapDescriptor.defaultMarker;

  final locationCtrl = Get.put(LocationController());

  void addMarkers() {
    print('maker추가시작');
    setState(() {
      markers.addAll(locationCtrl.getMarkers());
    });
    print('추가완료');
  }

  Future<void> setCustomMarkerIcon() async {
    // await MapMananger.resizedIcon("assets/icons/current_location.png", 180)
    //     .then(
    //   (icon) {
    //     setState(() {
    //       currentLocationIcon = icon;
    //     });
    //   },
    // );
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(), "assets/icons/current_location.png")
        .then(
      (icon) {
        setState(() {
          currentLocationIcon = icon;
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    setCustomMarkerIcon();
    _getCurrentLocation();
    //addMarkers();
  }

  @override
  void dispose() {
    stream!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: currentPosition == null
            ? Center(
                child: Text('Loading..'),
              )
            : Stack(children: [
                GoogleMap(
                  zoomGesturesEnabled: true,
                  zoomControlsEnabled: false,
                  myLocationButtonEnabled: true,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(
                        currentPosition!.latitude, currentPosition!.longitude),
                    zoom: 16.5,
                  ),
                  onMapCreated: (GoogleMapController controller) {
                    mapController = controller;
                    addMarkers();
                  },
                  markers: markers,
                ),
                _DoubleFloatingButton(),
                HomeAppbar(),
              ]));
  }

  Future<void> _getCurrentLocation() async {
    print('asfd');
    final Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    setState(() {
      currentPosition = position;
      markers.add(
        Marker(
          icon: currentLocationIcon,
          markerId: MarkerId('current_position'),
          position: LatLng(position.latitude, position.longitude),
        ),
      );
    });

    final Stream<Position> positionStream = Geolocator.getPositionStream(
        locationSettings: LocationSettings(accuracy: LocationAccuracy.high));
    stream = positionStream.listen((Position position) {
      setState(() {
        currentPosition = position;
        markers.removeWhere(
            (marker) => marker.markerId.value == 'current_position');
        markers.add(
          Marker(
            icon: currentLocationIcon,
            markerId: MarkerId('current_position'),
            position: LatLng(position.latitude, position.longitude),
          ),
        );
      });
      // if (mapController != null) {
      //   mapController!.animateCamera(CameraUpdate.newCameraPosition(
      //       CameraPosition(
      //           zoom: 16.5,
      //           target: LatLng(position.latitude, position.longitude))));
      // }
    });
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
        height: MediaQuery.of(context).size.height / 10,
      )
    ]);
  }
}
