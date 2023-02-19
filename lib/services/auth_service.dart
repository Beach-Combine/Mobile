import 'package:beach_combine/data.dart';
import 'package:beach_combine/models/body/get_token_body.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
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

  Future<bool> getToken(
      String name, String email, String id, String token) async {
    try {
      final res = await Dio().post("$url/login/google",
          options: Options(headers: {'Authorization': 'Bearer $token'}),
          data: {"profileObj": GetTokenBody(name, email, id)});
      print(res.data);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
