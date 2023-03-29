import 'package:beach_combine/controllers/auth_controller.dart';
import 'package:beach_combine/controllers/map_controller.dart';
import 'package:beach_combine/models/giftcard.dart';
import 'package:beach_combine/models/my_record/my_record.dart';
import 'package:beach_combine/models/purchase.dart';
import 'package:beach_combine/models/record.dart';
import 'package:beach_combine/services/mine_service.dart';
import 'package:beach_combine/widgets/history_modal_dialog.dart';
import 'package:custom_marker/marker_icon.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/member.dart';

class MineController extends GetxController {
  final mineService = MineService();
  final mapController = Get.find<MapController>();
  var status = false.obs;
  final isLoading = true.obs;
  var showEditButton = false.obs;
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
  final gridRecords = <Record>[].obs;
  final markerRecords = RxSet<Marker>();
  final editedName = ''.obs;
  final editedEmail = ''.obs;
  final testPoint = 10000.obs;

  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;

  @override
  void onInit() {
    setMarkerIcon();
    getMember();
    getGiftcards();
    getPoint();
    getMarkerRecords();
    getGridRecord();
    isLoading.value = false;
    super.onInit();
  }

  setMarkerIcon() async {
    markerIcon = await MarkerIcon.pictureAsset(
        assetPath: 'assets/icons/map_badge.png', width: 100, height: 100);
  }

  setShowEditButton() {
    if (editedName.value == member.value.nickname &&
        editedEmail.value == member.value.email) {
      showEditButton.value = false;
    } else {
      showEditButton.value = true;
    }
  }

  void switchStatus() {
    status.value = !status.value;
    toggleProfilePublic(status.value);
  }

  Future<void> getMember() async {
    print('[멤버 업데이트]');
    final member = await mineService.getMember();
    this.member.value = member!;
    this.editedName.value = member.nickname;
    this.editedEmail.value = member.email;
    status.value = member.profilePublic;
    print(status.value);
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
    purchaseList.value = result;
  }

  Future<bool> purchaseGiftcard(int id) async {
    final result = await mineService.purchaseGiftcard(id);
    return result;
  }

  Future<void> getMarkerRecords() async {
    final result = await mineService.getMarkerRecords();

    result.forEach((element) async {
      final records = await getRecords(element.id);
      final position =
          LatLng(double.parse(element.lat), double.parse(element.lng));
      final marker = Marker(
        markerId: MarkerId('MarkerRecord${element.id}'),
        position: position,
        icon: markerIcon,
        onTap: () {
          Get.dialog(HistoryModalDialog(record: records!));
        },
      );
      markerRecords.add(marker);
    });
  }

  Future<MyRecord?> getRecords(int id) async {
    final result = await mineService.getRecords(id);
    return result;
  }

  Future<void> editAccount() async {
    final result = await mineService.editAccount(editedName.value);
    if (result) {
      await getMember();
      setShowEditButton();
    }
  }

  Future<void> toggleProfilePublic(bool option) async {
    mineService.toggleProfilePublic(option);
    mapController.getLocation();
  }

  Future<void> getGridRecord() async {
    final result = await mineService.getGridRecord();
    gridRecords.addAll(result);
  }
}
