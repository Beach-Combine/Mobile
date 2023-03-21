import 'package:beach_combine/common/Dio/dio.dart';
import 'package:beach_combine/data.dart';
import 'package:dio/dio.dart';

class PointService {
  final url = '$baseUrl/members/point';

  Future<bool> getPoint(int option) async {
    try {
      final dio = Dio();
      dio.interceptors.add(CustomInterceptor());
      final res = await dio.patch('$url/$option',
          options: Options(headers: {
            'Content-Type': 'application/json',
            'accessToken': 'true'
          }));
      print('[PATCH] $url/$option | response : ${res.data}');
      return true;
    } catch (e) {
      return false;
    }
  }
}
