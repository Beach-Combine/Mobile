import 'package:beach_combine/common/Dio/dio.dart';
import 'package:beach_combine/data.dart';
import 'package:dio/dio.dart';

class MemberService {
  final url = '$baseUrl/members/tutorial';

  Future<bool> tutorialComplete() async {
    try {
      final dio = Dio();
      dio.interceptors.add(CustomInterceptor());
      await dio.patch(
        url,
        options: Options(
          headers: {'content-type': 'application/json', 'accessToken': 'true'},
        ),
      );
      return true;
    } catch (e) {
      return false;
    }
  }
}
