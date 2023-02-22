import 'package:get/get.dart';

class ProfileController extends GetxController {
  var status = false.obs;

  void switchStatus() {
    status.value = !status.value;
  }
}
