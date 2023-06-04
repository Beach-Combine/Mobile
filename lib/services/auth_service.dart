import 'package:beach_combine/common/Dio/dio.dart';
import 'package:beach_combine/data.dart';
import 'package:beach_combine/models/body/get_token_body.dart';
import 'package:beach_combine/models/response/get_token_response.dart';
import 'package:beach_combine/utils/token_manager.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService with TokenManager {
  final url = '$baseUrl/auth';

  // Google Sign in
  signInWithGoogle() async {
    // begin interactive sign in process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    // obtain auth details from request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    // create a new credential for user
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    // finally lets sign in
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<Map<String, dynamic>> refreshToken() async {
    try {
      final res = await Dio().post('$url/token',
          options: Options(headers: {
            "Accept": "application/json",
            "content-type": "application/json"
          }),
          data: {"refreshToken": "Bearer ${getToken(REFRESH_TOKEN_KEY)}"});
      saveToken(ACCESS_TOKEN_KEY, res.data['accessToken']);
      return {
        'result': true,
        'role': res.data['role'],
        'tutorialCompleted': res.data['tutorialCompleted']
      };
    } catch (e) {
      print(e);
      return {'result': false};
    }
  }

  Future<Map<String, dynamic>> login(
      {required String displayName,
      required String email,
      required String id,
      required String photoUrl,
      required String code}) async {
    try {
      print('$url/google');
      print(displayName);
      print(email);
      print(id);
      print(photoUrl);
      print(code);
      print(GetTokenBody(
          email: email,
          id: id,
          displayName: displayName,
          photoUrl: photoUrl,
          serverAuthCode: code));
      final res = await Dio().post("$url/google",
          options: Options(headers: {
            "Accept": "application/json",
            "content-type": "application/json"
          }),
          data: GetTokenBody(
              id: id,
              email: email,
              displayName: displayName,
              photoUrl: photoUrl,
              serverAuthCode: code));
      final result = GetTokenResponse.fromJson(res.data);
      print(result.accessToken);
      saveToken(ACCESS_TOKEN_KEY, result.accessToken);
      saveToken(REFRESH_TOKEN_KEY, result.refreshToken);
      print(res.data['tutorialCompleted']);
      return {
        'result': true,
        'role': res.data['role'],
        'tutorialCompleted': res.data['tutorialCompleted']
      };
    } catch (e) {
      print(e);
      return {'result': false};
    }
  }

  Future<void> logout() async {
    print('$url/logout');
    try {
      final dio = Dio();
      dio.interceptors.add(CustomInterceptor());

      final res = dio.post('$url/logout',
          options: Options(
            headers: {
              "accessToken": "true",
              "content-type": "application/json"
            },
          ),
          data: {'accessToken': 'Bearer ${getToken(ACCESS_TOKEN_KEY)}'});
      print('logout success');
    } catch (e) {
      print(e);
    }
  }
}
