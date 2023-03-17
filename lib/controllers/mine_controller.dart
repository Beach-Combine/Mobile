import 'dart:math';

import 'package:beach_combine/controllers/auth_controller.dart';
import 'package:beach_combine/models/giftcard.dart';
import 'package:beach_combine/models/purchase.dart';
import 'package:beach_combine/services/mine_service.dart';
import 'package:get/get.dart';

import '../models/member.dart';

class MineController extends GetxController {
  final mineService = MineService();
  final authController = Get.find<AuthController>();
  var status = false.obs;
  var name = ''.obs;
  var email = ''.obs;
  var image = ''.obs;
  final point = 0.obs;
  final member = Member(
          email: 'email',
          monthPoint: 0,
          nickname: 'nickname',
          purchasePoint: 0,
          id: 0,
          image: 'image',
          profilePublic: true,
          role: 'role',
          totalPoint: 0)
      .obs;
  final giftcards = <Giftcard>[].obs;
  final purchaseList = <Purchase>[].obs;

  @override
  void onInit() {
    getMember();
    getGiftcards();
    getPoint();
    super.onInit();
  }

  void switchStatus() {
    status.value = !status.value;
  }

  Future<void> getMember() async {
    final member = await mineService.getMember();
    this.member.value = member!;
    status.value = member.profilePublic;
  }

  Future<void> getGiftcards() async {
    final result = await mineService.getGiftcards();
    giftcards.addAll(result);
  }

  getPoint() async {
    final result = await mineService.getPoint();
    point.value = result;
  }

  Future<void> getPurchase() async {
    final result = await mineService.getPurchase();
    purchaseList.addAll(result);
  }

  Future<bool> purchaseGiftcard(int id) async {
    final result = await mineService.purchaseGiftcard(id);
    return result;
  }
}
