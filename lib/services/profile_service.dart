import 'package:beach_combine/common/Dio/dio.dart';
import 'package:beach_combine/data.dart';
import 'package:beach_combine/models/member.dart';
import 'package:dio/dio.dart';

class ProfileService {
  final url = '$baseUrl/members';

  Future<Member?> getMember() async {
    try {
      final dio = Dio();
      dio.interceptors.add(CustomInterceptor());

      final res = await dio.get(url,
          options: Options(headers: {"accessToken": "true"}));
      print(res);
      final member = Member.fromJson(res.data);
      return member;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
