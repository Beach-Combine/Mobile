import 'package:beach_combine/common/Dio/dio.dart';
import 'package:beach_combine/data.dart';
import 'package:beach_combine/models/ranking.dart';
import 'package:dio/dio.dart';

class RankingService {
  final url = '$baseUrl/members/ranking?';

  Future<List<Ranking>?> getMonthlyRanking(int pageSize) async {
    try {
      final dio = Dio();
      dio.interceptors.add(CustomInterceptor());
      final res = await dio.get('${url}range=month&pageSize=$pageSize',
          options: Options(headers: {
            "Content-Type": "application/json",
            "accessToken": "true",
          }));
      print(res.data);
      final ranking = Ranking.fromJsonList(res.data['memberDtoList']);
      return ranking;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<Ranking>> getAllRanking(
      int lastId, int lastPoint, int pageSize, bool isFirst) async {
    try {
      final dio = Dio();
      dio.interceptors.add(CustomInterceptor());
      if (isFirst) {
        final res = await dio.get('${url}range=all&pageSize=$pageSize',
            options: Options(headers: {
              "Content-Type": "application/json",
              "accessToken": "true",
            }));
        final ranking = Ranking.fromJsonList(res.data['memberDtoList']);
        return ranking;
      } else {
        final res = await dio.get(
            '${url}range=all&pageSize=$pageSize&lastId=$lastId&lastPoint=$lastPoint',
            options: Options(headers: {
              'Content-Type': "application/json",
              "accessToken": "true"
            }));
        print(res.data['memberDtoList']);
        final ranking = Ranking.fromJsonList(res.data['memberDtoList']);
        return ranking;
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
}
