import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';

class LocationController extends GetxController {
  Position? previousPosition;
  var distance = 0.0.obs;
  var lat = 0.0.obs;
  var lng = 0.0.obs;
  var isDiscovered = false.obs;
  var isSepered = false.obs;

  @override
  void onInit() async {
    super.onInit();
  }

  showDiscover() {
    isDiscovered.value = true;
    isSepered.value = false;
  }

  showSeper() {
    isSepered.value = true;
    isDiscovered.value = false;
  }

  Future<void> updateLocation(Position position) async {
    try {
      // final position = await Geolocator.getCurrentPosition(
      //   desiredAccuracy: LocationAccuracy.high,
      // );
      if (previousPosition != null) {
        distance.value += await Geolocator.distanceBetween(
          previousPosition!.latitude,
          previousPosition!.longitude,
          position.latitude,
          position.longitude,
        );
      }
      previousPosition = position;
      lat.value = previousPosition!.latitude;
      lng.value = previousPosition!.longitude;
    } catch (e) {
      print(e);
    }
  }
}
