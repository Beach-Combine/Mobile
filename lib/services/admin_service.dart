import 'package:beach_combine/common/Dio/dio.dart';
import 'package:beach_combine/data.dart';
import 'package:beach_combine/models/certification_requests.dart';
import 'package:dio/dio.dart';

class AdminService {
  final url = '$baseUrl/admin/trashcans';

  Future<List<CertificationRequests>> getCertificationRequests() async {
    try {
      final dio = Dio();
      dio.interceptors.add(CustomInterceptor());
      final res = await dio.get('$url/certification-requests',
          options: Options(headers: {
            'Content-type': 'application/json',
            'accessToken': 'true'
          }));
      print(res.data);
      final certificationRequests =
          CertificationRequests.fromJsonList(res.data);
      return certificationRequests;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
