import 'dart:math';

import 'package:beach_combine/services/profile_service.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final profileService = ProfileService();
  var status = false.obs;

  var name = ''.obs;
  var email = ''.obs;
  var image = ''.obs;

  @override
  void onInit() {
    getMember();
    super.onInit();
  }

  void switchStatus() {
    status.value = !status.value;
  }

  Future<void> getMember() async {
    final member = await profileService.getMember();
    if (member != null) {
      name.value = member.nickname;
      email.value = member.email;
      image.value = member.image;
    }
    print(name.value);
    print(email.value);
    print(image.value);
  }
}
