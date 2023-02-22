import 'package:beach_combine/data.dart';
import 'package:beach_combine/utils/token_manager.dart';
import 'package:dio/dio.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class LocationService with TokenManager {
  final url = baseUrl;

  Future<bool> getBeachLocation() async {
    try {
      print('$url/beaches/map');
      print(getToken(ACCESS_TOKEN_KEY));
      final res = await Dio().get(
        '$url/beaches/map',
        options: Options(headers: {
          "Accept": "application/json",
          "Content-type": "application/json",
          "Authorization": "Bearer ${getToken(ACCESS_TOKEN_KEY)}",
        }),
      );
      print(res.data);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
