import 'package:beach_combine/common/Dio/dio.dart';
import 'package:beach_combine/data.dart';
import 'package:beach_combine/models/body/record_body.dart';
import 'package:dio/dio.dart';

class RecordService {
  final url = '$baseUrl/records';

  Future<bool> recordCleaning(
    int id,
    int time,
    int range,
    dynamic beforeImage,
    dynamic afterImage,
  ) async {
    try {
      final dio = Dio();
      dio.interceptors.add(CustomInterceptor());
      final res = await dio.post('$url/${id}',
          options: Options(headers: {
            'Content-Type': 'multipart/form-data',
            'accessToken': 'true'
          }),
          data: RecordBody(
                  id: id,
                  time: time,
                  range: range,
                  beforeImage: beforeImage,
                  afterImage: afterImage)
              .toJson());
      print(res.data);
      return true;
    } catch (e) {
      return false;
    }
  }
}
