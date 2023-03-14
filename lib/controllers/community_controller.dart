import 'package:beach_combine/models/feed.dart';
import 'package:beach_combine/services/community_service.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CommunityController extends GetxController {
  final communityService = CommunityService();
  final feedList = <Feed>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    getFeeds();
    super.onInit();
  }

  getFeeds() async {
    final result = await communityService.getFeeds();
    feedList.addAll(result);
  }
}
