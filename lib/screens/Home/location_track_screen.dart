import 'package:beach_combine/controllers/range_controller.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocationTrackerScreen extends StatefulWidget {
  @override
  _LocationTrackerScreenState createState() => _LocationTrackerScreenState();
}

class _LocationTrackerScreenState extends State<LocationTrackerScreen> {
  final LocationController locationController = Get.put(LocationController());

  @override
  void initState() {
    super.initState();
    _startListening();
  }

  @override
  void dispose() {
    _stopListening();
    super.dispose();
  }

  void _startListening() {
    Geolocator.getPositionStream().listen((Position position) {
      locationController.updateLocation(position);
    });
  }

  void _stopListening() {
    //Geolocator.getPositionStream().cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Location Tracker'),
        ),
        body: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => Text(
                  'Total Distance: ${locationController.distance.toStringAsFixed(2)} meters',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              SizedBox(height: 20),
              Obx(() => Text(
                    'Current Location: ${locationController.lat}, ${locationController.lng}',
                    style: TextStyle(fontSize: 24),
                  )),
            ],
          ),
        )
            // : Center(
            //     child: CircularProgressIndicator(),
            //   ),
            ));
  }
}
