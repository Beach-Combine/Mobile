import 'package:beach_combine/common/Dio/dio.dart';
import 'package:beach_combine/data.dart';
import 'package:beach_combine/models/feed.dart';
import 'package:beach_combine/models/record.dart';
import 'package:dio/dio.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class CommunityService {
  final url = "$baseUrl";

  Future<List<Feed>> getFeeds() async {
    try {
      final dio = Dio();
      dio.interceptors.add(CustomInterceptor());
      final res = await dio.get('$url/feeds',
          options: Options(headers: {
            'Content-type': 'application/json',
            'accessToken': 'true'
          }));
      print('[GET] [피드 가져오기] ${res.data}');
      final feeds = Feed.fromJsonList(res.data);
      return feeds;
    } catch (e) {
      print(e);
      print('[피드에러]');
      return [];
    }
  }

  Future<List<Record>> getRecords() async {
    try {
      final dio = Dio();
      dio.interceptors.add(CustomInterceptor());
      final res = await dio.get('$url/records',
          options: Options(headers: {
            'Content-type': 'application/json',
            'accessToken': 'true'
          }));
      print('[GET] [레코드 요청] ${res}');
      final records = Record.fromJsonList(res.data);
      return records;
    } catch (e) {
      return [];
    }
  }
}
