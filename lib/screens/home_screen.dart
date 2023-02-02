import 'dart:ui' as ui;

import 'package:beach_combine/widgets/home_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  GoogleMapController? mapController;
  Set<Marker> markers = Set();
  LatLng sourceLocation = LatLng(35.153884196941334, 129.11847977037488);
  LatLng destination = LatLng(35.153884196941334, 129.11847977037488);

  @override
  void initState() {
    addMarkers();
    super.initState();
  }

  addMarkers() async {
    final Uint8List markerIcon =
        await getBytesFromAsset('assets/icons/selfmarker.png', 150);
    final Marker marker = Marker(
        icon: BitmapDescriptor.fromBytes(markerIcon),
        markerId: MarkerId('self'),
        position: sourceLocation);

    setState(() {
      markers.add(marker);
    });
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          body: Stack(children: [
            GoogleMap(
              zoomGesturesEnabled: true,
              zoomControlsEnabled: false,
              myLocationButtonEnabled: true,
              initialCameraPosition:
                  CameraPosition(target: sourceLocation, zoom: 14.5),
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
              height: 65,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(50)),
              child: Center(
                  child: Text(
                "Start cleaning here",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color: Colors.white,
                ),
              )),
            ),
            onTap: () {},
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 20,
          ),
          GestureDetector(
            child: Container(
              height: 65,
              width: 65,
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
