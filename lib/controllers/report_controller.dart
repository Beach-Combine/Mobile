import 'package:beach_combine/services/report_service.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ReportController extends GetxController {
  final reportService = ReportService();

  Future<bool> reportTrachcan(lat, lng, image) async {
    final result = reportService.reportTrashcan(lat, lng, image);
    return result;
  }
}
