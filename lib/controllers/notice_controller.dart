import 'package:beach_combine/services/notice_service.dart';
import 'package:get/get.dart';
import 'package:beach_combine/models/notification.dart' as noti;

class NoticeController extends GetxController {
  final noticeService = NoticeService();
  final notifications = <noti.Notification>[].obs;

  @override
  onInit() {
    super.onInit();
    getNotifications();
  }

  @override
  onClose() {
    super.onClose();
  }

  Future<void> getNotifications() async {
    final result = await noticeService.getNotifications();
    notifications.value = result;
  }
}
