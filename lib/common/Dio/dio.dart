import 'package:beach_combine/data.dart';
import 'package:beach_combine/utils/token_manager.dart';
import 'package:dio/dio.dart';

class CustomInterceptor extends Interceptor with TokenManager {
  // 1) 요청 보낼때
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    print('[REQ] [${options.method}] ${options.uri}');

    if (options.headers['accessToken'] == 'true') {
      options.headers.remove('accessToken');

      final token = await getToken(ACCESS_TOKEN_KEY);
      print(token);
      options.headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }

    if (options.headers['refreshToken'] == 'true') {
      options.headers.remove('refreshToken');

      final token = await getToken(REFRESH_TOKEN_KEY);

      options.headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }
    return super.onRequest(options, handler);
  }
  // 2) 응답 받을 때

  // 3) 에러가 났을 때
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    // 401에러 났을때
    // 토큰을 재발급 받는 시도를 하고 토큰이 재발급되면
    // 다시 새로운 토큰으로 요청을 한다.
    print('[ERR] [${err.requestOptions.method}] ${err.requestOptions.uri}');

    //handler.resolve(err.response!);
    print(err.response!.data);
    final refreshToken = await getToken(REFRESH_TOKEN_KEY);

    // refreshToken이 없으면
    // 당연히 에러를 던진다.
    if (refreshToken == null) {
      // 에러를 던지는 Dio의 룰
      return handler.reject(err);
    }

    final isStatus401 = err.response?.statusCode == 401; // 401이거나 false 거나
    final isPathRefresh = err.requestOptions.path == '/auth/token';

    if (isStatus401 && !isPathRefresh) {
      final dio = Dio();
      try {
        final res = await dio.post('${baseUrl}/auth/token',
            options: Options(headers: {
              "Accept": "application/json",
              "content-type": "application/json"
            }),
            data: {"refreshToken": "Bearer ${getToken(REFRESH_TOKEN_KEY)}"});

        final accessToken = res.data['accessToken'];
        final options = err.requestOptions;

        // 토큰 변경하기
        options.headers.addAll({
          'Authorization': 'Bearer $accessToken',
        });

        await saveToken(ACCESS_TOKEN_KEY, accessToken);

        // 요청 재전송
        final response = await dio.fetch(options);

        return handler.resolve(response);
      } catch (e) {
        return handler.reject(err);
      }
    }

    return super.onError(err, handler);
  }
}
