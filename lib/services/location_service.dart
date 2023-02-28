import 'package:beach_combine/common/Dio/dio.dart';
import 'package:beach_combine/data.dart';
import 'package:beach_combine/models/beach_location.dart';
import 'package:beach_combine/models/trashcan_location.dart';
import 'package:beach_combine/utils/token_manager.dart';
import 'package:dio/dio.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class LocationService with TokenManager {
  final url = baseUrl;

  Future<List<BeachLocation>> getBeachLocation() async {
    try {
      final dio = Dio();
      dio.interceptors.add(CustomInterceptor());
      print('$url/beaches/map');
      print(getToken(ACCESS_TOKEN_KEY));
      print(getToken(REFRESH_TOKEN_KEY));
      final res = await dio.get(
        '$url/beaches/map',
        options: Options(headers: {
          "Accept": "application/json",
          "Content-type": "application/json",
          "Authorization": "Bearer ${getToken(ACCESS_TOKEN_KEY)}",
        }),
      );
      print(res.data);
      final beachLocation = BeachLocation.fromJsonList(res.data);
      return beachLocation;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<TrashcanLocation>> getTrashcanLocation() async {
    try {
      final dio = Dio();
      dio.interceptors.add(CustomInterceptor());
      print('$url/trashcans/map');
      print(getToken(ACCESS_TOKEN_KEY));
      print(getToken(REFRESH_TOKEN_KEY));
      final res = await dio.get(
        '$url/trashcans/map',
        options: Options(headers: {
          "Accept": "application/json",
          "Content-type": "application/json",
          "Authorization": "Bearer ${getToken(ACCESS_TOKEN_KEY)}",
        }),
      );
      print(res.data);
      final trashcanLocation = TrashcanLocation.fromJsonList(res.data);
      return trashcanLocation;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
