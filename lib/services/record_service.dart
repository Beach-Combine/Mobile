import 'package:beach_combine/common/Dio/dio.dart';
import 'package:beach_combine/data.dart';
import 'package:beach_combine/models/body/record_body.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class RecordService {
  final url = '$baseUrl/records';

  Future<bool> recordCleaning(
    int id,
    String time,
    int range,
    dynamic beforeImage,
    dynamic afterImage,
  ) async {
    try {
      // final bytes = await rootBundle.load('assets/images/person1.png');
      //final image = bytes.buffer.asUint8List();

      // final ImagePicker _picker = ImagePicker();
      // // Pick an image
      // final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      final formData = FormData.fromMap({
        'time': time,
        'range': range,
        'beforeImage': await MultipartFile.fromFile(beforeImage.path),
        'afterImage': await MultipartFile.fromFile(afterImage.path),
      });
      // final formData = FormData.fromMap({
      //   'time': time,
      //   'range': range,
      //   'beforeImage': null,
      //   'afterImage': null,
      // });
      final dio = Dio();
      dio.interceptors.add(CustomInterceptor());
      final res = await dio.post('$url/${id}',
          options: Options(headers: {
            'Content-Type': 'multipart/form-data',
            'accessToken': 'true'
          }),
          data: formData);
      print(res.data);
      return true;
    } on DioError catch (e) {
      print(e);
      if (e.response != null) {
        print(e.response!.data);
      } else {
        print(e.message);
      }
      return false;
    }
  }
}
