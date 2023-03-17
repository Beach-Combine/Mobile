import 'package:beach_combine/controllers/image_controller.dart';
import 'package:beach_combine/controllers/map_controller.dart';
import 'package:beach_combine/controllers/range_controller.dart';
import 'package:beach_combine/controllers/time_controller.dart';
import 'package:beach_combine/models/Beach_Info/beach.dart';
import 'package:beach_combine/services/record_service.dart';
import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class RecordController extends GetxController {
  final timeController = Get.find<TimerController>();
  final rangeController = Get.find<LocationController>();
  final mapController = Get.find<MapController>();
  final imageController = Get.find<ImageController>();

  final recordService = RecordService();

  Future<bool> recordCleaning() async {
    final id = mapController.selectedBeach;
    final time = timeController.cleaningTime;
    final range = rangeController.cleaningDistance;
    final beforeImage = imageController.beforeImage;
    final afterImage = imageController.afterImage;
    // print(id);
    // print(time);
    // print(range);
    // print(imageController.beforeImage);
    // print(imageController.afterImage);

    final result = await recordService.recordCleaning(id, time, range, beforeImage, afterImage);
    return result;
  }
}
