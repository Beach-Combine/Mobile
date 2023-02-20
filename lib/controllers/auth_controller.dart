import 'package:beach_combine/common/beach_combine.dart';
import 'package:beach_combine/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  final authService = AuthService();
  FirebaseAuth auth = FirebaseAuth.instance;
  var _googleSignIn = GoogleSignIn();
  var googleAcc = Rx<GoogleSignInAccount?>(null);
  var isSignedIn = false.obs;
  var token;
  var email;
  var id;
  var name;

  User? get userProfile => auth.currentUser;

  @override
  void onInit() {
    super.onInit();
  }

  void signInWithGoogle() async {
    try {
      googleAcc.value = await _googleSignIn.signIn();
      // await _googleSignIn.signIn().then((result) {
      //   result!.authentication.then((googleKey) {
      //     //print(googleKey.accessToken);
      //     token = googleKey.accessToken;
      //     //print(googleKey.idToken);
      //     name = _googleSignIn.currentUser!.displayName;
      //     email = _googleSignIn.currentUser!.email;
      //     id = _googleSignIn.currentUser!.id;
      //   }).catchError((err) {
      //     print('inner error');
      //   });
      // }).catchError((err) {
      //   print('error occured');
      // });
      // isSignedIn.value = true;
      update();
      // final GoogleSignInAuthentication googleSignInAuthentication =
      // await _googlesignIn.;
      // final AuthCredential credential = GoogleAuthProvider.getCredential(
      //   accessToken: googleSignInAuthentication.accessToken,
      //   idToken: googleSignInAuthentication.idToken,
      // );
      // final authResult = await     _auth.signInWithCredential(credential);
      // print(googleAcc.value);
      // print(googleAcc.value!.authentication.then((value) {
      //   value.accessToken;
      // }));
      getToken();
      //Get.offAll(BeachCombine());
    } catch (e) {
      print(e);
      Get.snackbar('Error occured!', e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void getToken() async {
    await authService.getToken(
        id: googleAcc.value!.id,
        displayName: googleAcc.value!.displayName!,
        photoUrl: googleAcc.value!.photoUrl!,
        code: googleAcc.value!.serverAuthCode!,
        email: googleAcc.value!.email);
  }
}
