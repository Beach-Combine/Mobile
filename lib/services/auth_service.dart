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

  Future<bool> login(
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
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<void> logout() async {
    print('$url/logout');
    try {
      final res = Dio().post(
        '$url/logout',
        options: Options(headers: {
          "Authorization": "Bearer ${getToken(ACCESS_TOKEN_KEY)}",
          "content-type": "application/json"
        }),
      );
      print('logout success');
    } catch (e) {
      print(e);
    }
  }
}
