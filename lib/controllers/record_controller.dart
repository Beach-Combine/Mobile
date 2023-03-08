import 'package:beach_combine/controllers/map_controller.dart';
import 'package:beach_combine/controllers/range_controller.dart';
import 'package:beach_combine/controllers/time_controller.dart';
import 'package:beach_combine/services/record_service.dart';
import 'package:dio/dio.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class RecordController extends GetxController {
  final timeController = TimerController();
  final rangeController = LocationController();
  final recordService = RecordService();
  final mapController = MapController();

  Future<bool> recordCleaning() async {
    final id = mapController.selectedBeach;
    final time = timeController.cleaningTime;
    final range = rangeController.cleaningDistance;
    final beforeImage = FormData.fromMap({
      'file': await MultipartFile.fromFile(
        'assets/images/before_2.jpeg',
        //filename: 'before_2.jpeg',
      ),
    });
    final afterImage = FormData.fromMap({
      'file': await MultipartFile.fromFile(
        'assets/images/after.png',
        filename: 'after.png',
      ),
    });
    final result = await recordService.recordCleaning(
        id, time, range, beforeImage, afterImage);
    return result;
  }
}
