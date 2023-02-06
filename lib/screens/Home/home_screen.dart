import 'dart:ui' as ui;

import 'package:beach_combine/utils/app_style.dart';
import 'package:beach_combine/utils/map_manager.dart';
import 'package:beach_combine/widgets/home_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GoogleMapController? mapController;
  Set<Marker> markers = Set();
  LatLng sourceLocation = LatLng(35.153884196941334, 129.11847977037488);
  LatLng destination = LatLng(35.153884196941334, 129.11847977037488);

  @override
  void initState() {
    _addMarkers();
    super.initState();
  }

  _addMarkers() async {
    final Marker marker = await MapMananger.resizeImage(
        sourceLocation, 'assets/icons/selfmarker.png', 'self', 180);

    setState(() {
      markers.add(marker);
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
                  style: Styles.body12TextWhite,
                ),
              ),
            ),
            onTap: () {},
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
