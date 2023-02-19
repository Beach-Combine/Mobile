import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:location/location.dart';

class LocationController extends GetxController {
  Location location = Location();
  LocationData? currentLocation;
  @override
  void onInit() {
    // called immediately after the widget is allocated memory
    getCurrentLocation();
    super.onInit();
  }

  getCurrentLocation() async {
    currentLocation = await location.getLocation().then((location) {
      currentLocation = location;
    });
  }
}
