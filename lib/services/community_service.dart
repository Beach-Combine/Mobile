import 'package:beach_combine/common/Dio/dio.dart';
import 'package:beach_combine/data.dart';
import 'package:beach_combine/models/feed.dart';
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
      print(res);
      final feeds = Feed.fromJsonList(res.data);
      return feeds;
    } catch (e) {
      print('[피드에러]');
      return [];
    }
  }
}
