import 'package:beach_combine/controllers/history_controller.dart';
import 'package:beach_combine/screens/Mine/history_list_screen.dart';
import 'package:beach_combine/utils/map_manager.dart';
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
  GoogleMapController? mapController;
  LocationData? currentLocation;
  Set<Marker> markers = Set();
  static final LatLng kMapCenter = LatLng(35.3830798112092, 127.75461824125226);
  static final List<LatLng> myBadgeList = [
    LatLng(37.59263650131627, 126.45833478728932),
    LatLng(37.38525822760204, 126.40885499187159),
    LatLng(35.242735293873274, 126.30619487477078),
    LatLng(34.713383506552844, 127.27149712084598),
    LatLng(334.824204931234306, 128.43994213019323),
    LatLng(35.031682077724405, 128.68978990449128),
    LatLng(35.159087, 129.162814),
    LatLng(38.11788478931436, 128.63388806207118),
    LatLng(38.02511097211657, 128.72204637081694),
    LatLng(33.211082568254106, 126.26074339287213),
    LatLng(33.54472332697766, 126.6741666971654),
  ];

  static final CameraPosition _kInitialPosition =
      CameraPosition(target: kMapCenter, zoom: 6.7, tilt: 0, bearing: 0);

  @override
  void initState() {
    _addMarkers();
    super.initState();
  }

  _addMarkers() async {
    // Position position = await Geolocator.getCurrentPosition(
    //     desiredAccuracy: LocationAccuracy.high);
    // final LatLng currentLocation =
    //     LatLng(position.latitude, position.longitude);
    // print(currentLocation);

    setState(() {
      markers.add(Marker(
          markerId: MarkerId("mylocation"),
          draggable: true,
          onTap: () => print("Marker!"),
          position: LatLng(35.1539, 129.1203)));
    });

    for (int i = 0; i < myBadgeList.length; i++) {
      final Marker marker = await MapMananger.resizeImage(
          myBadgeList[i],
          'assets/icons/badge.png',
          'self$i',
          100,
          (() => showDialog<String>(
              context: context,
              builder: (BuildContext context) => ModalDialog(
                    afterPath: 'assets/images/after.png',
                    beforePath: 'assets/images/AdobeStock_210419020.png',
                    date: DateTime.utc(2022, 4, 5),
                    location: "Gwangalli Beach",
                    imagePath: 'assets/icons/badge_ver2.png',
                    range: 100,
                    time: '00:59:59',
                  ))));

      setState(() {
        markers.add(marker);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(children: [
          GoogleMap(
            myLocationEnabled: false,
            zoomGesturesEnabled: true,
            zoomControlsEnabled: false,
            myLocationButtonEnabled: false,
            initialCameraPosition: _kInitialPosition,
            markers: markers,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height / 10.5,
                horizontal: MediaQuery.of(context).size.width / 14),
            child: Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: () {
                    controller.changeRoute();
                  },
                  child: Container(
                    height: 52,
                    width: 52,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: Center(
                      child: ImageIcon(
                        AssetImage("assets/icons/list.png"),
                      ),
                    ),
                  ),
                )),
          ),
        ]),
      ),
    );
  }
}
