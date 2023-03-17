import 'package:beach_combine/models/feed.dart';
import 'package:beach_combine/services/community_service.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../models/record.dart';

class CommunityController extends GetxController {
  final communityService = CommunityService();
  final feedList = <Feed>[].obs;
  final records = <Record>[].obs;
  final isLoading = true.obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    await getFeeds();
    await getRecords();
    isLoading.value = false;
    super.onInit();
  }

  getFeeds() async {
    final result = await communityService.getFeeds();
    feedList.addAll(result);
  }

  getRecords() async {
    final result = await communityService.getRecords();
    records.addAll(result);
  }
}
