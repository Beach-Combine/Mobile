import 'package:beach_combine/common/Dio/dio.dart';
import 'package:beach_combine/data.dart';
import 'package:dio/dio.dart';

class ReportService {
  final url = '$baseUrl/trashcans';

  Future<bool> reportTrashcan(double lat, double lng, dynamic image) async {
    try {
      final formData = FormData.fromMap({
        'lat': lat,
        'lng': lng,
        'image': await MultipartFile.fromFile(image.path),
      });

      final dio = Dio();
      dio.interceptors.add(CustomInterceptor());
      final res = await dio.post(url,
          options: Options(headers: {
            'Content-type': 'multipart/form-data',
            'accessToken': 'true'
          }),
          data: formData);
      print(res.data);
      return true;
    } catch (e) {
      return false;
    }
  }
}
