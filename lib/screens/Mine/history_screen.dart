import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  GoogleMapController? mapController;
  Set<Marker> markers = Set();
  static final LatLng kMapCenter = LatLng(35.3830798112092, 127.75461824125226);

  static final CameraPosition _kInitialPosition =
      CameraPosition(target: kMapCenter, zoom: 6.7, tilt: 0, bearing: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        zoomGesturesEnabled: true,
        zoomControlsEnabled: true,
        myLocationButtonEnabled: false,
        initialCameraPosition: _kInitialPosition,
      ),
    );
  }
}
