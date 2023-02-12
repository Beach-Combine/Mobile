import 'package:beach_combine/screens/Home/reward_screen.dart';
import 'package:beach_combine/utils/app_style.dart';
import 'package:beach_combine/utils/map_manager.dart';
import 'package:beach_combine/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class NearbyTrashcanScreen extends StatefulWidget {
  const NearbyTrashcanScreen({super.key});

  @override
  State<NearbyTrashcanScreen> createState() => _NearbyTrashcanScreenState();
}

class _NearbyTrashcanScreenState extends State<NearbyTrashcanScreen> {
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

    setState(() {
      markers.add(selfmarker);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      GoogleMap(
        zoomGesturesEnabled: true,
        zoomControlsEnabled: false,
        myLocationButtonEnabled: true,
        initialCameraPosition:
            CameraPosition(target: sourceLocation, zoom: 16.5),
        markers: markers,
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: _SeparateBottomSheet(),
      ),
    ]));
  }
}

class _SeparateBottomSheet extends StatelessWidget {
  const _SeparateBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24), topRight: Radius.circular(24))),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Image.asset(
                'assets/images/trashcan.png',
                width: 26,
              ),
              Gap(5),
              Text(
                'You found a trash can!',
                style: Styles.body21Text,
              ),
              Text(
                'Please separate the trash',
                style: Styles.titleText,
              ),
              Gap(40),
              PrimaryButton(
                  height: 60,
                  text: 'Saparate the trash here',
                  onTap: () async {
                    Get.offAll(RewardScreen(
                      isDifferentArea: false,
                      location: 'Gwangalli Beach',
                    ));
                  })
            ],
          ),
        ),
      ),
    ]);
  }
}
