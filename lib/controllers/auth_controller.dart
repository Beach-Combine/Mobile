import 'package:beach_combine/common/beach_combine.dart';
import 'package:beach_combine/data.dart';
import 'package:beach_combine/screens/Admin/admin_screen.dart';
import 'package:beach_combine/screens/Home/method_select_screen.dart';
import 'package:beach_combine/screens/Home/saperate_trash_screen.dart';
import 'package:beach_combine/screens/Tutorial/tutorial_screen.dart';
import 'package:beach_combine/screens/login_screen.dart';
import 'package:beach_combine/services/auth_service.dart';
import 'package:beach_combine/utils/token_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController with TokenManager {
  final authService = AuthService();
  FirebaseAuth auth = FirebaseAuth.instance;
  var _googleSignIn = GoogleSignIn();
  var googleAcc = Rx<GoogleSignInAccount?>(null);
  var isSignedIn = false.obs;
  var token;
  var email;
  var id;
  var name;
  var role;
  var tutorialCompleted = false;

  User? get userProfile => auth.currentUser;

  @override
  void onInit() {
    super.onInit();
  }

  void signInWithGoogle() async {
    try {
      googleAcc.value = await _googleSignIn.signIn();
      isSignedIn.value = true;
      update();
      //print(googleAcc.value!.authentication);

      final bool isFinished = await _login();
      print(FirebaseAuth.instance.currentUser);
      if (isFinished && role == 'ROLE_USER') {
        // Get.offAll(BeachCombine());
        Get.offAll(AdminScreen());
        // Get.offAll(TutorialScreen());
      } else {
        Get.offAll(AdminScreen());
      }
    } catch (e) {
      print(e);
      // Get.snackbar('Error occured!', e.toString(),
      //     snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<bool> _login() async {
    final result = await authService.login(
        id: googleAcc.value!.id,
        displayName: googleAcc.value!.displayName!,
        photoUrl: googleAcc.value!.photoUrl!,
        code: googleAcc.value!.serverAuthCode!,
        email: googleAcc.value!.email);
    role = result['role'];
    print(role);
    return result['result'];
  }

  Future<bool> refreshToken() async {
    final result = await authService.refreshToken();
    role = result['role'];
    print(role);
    return result['result'];
  }

  Future<void> logoutGoogle() async {
    await _googleSignIn.signOut();
    // await authService.logout();
    Future.wait(
        [removeToken(ACCESS_TOKEN_KEY), removeToken(REFRESH_TOKEN_KEY)]);
    Get.offAll(LoginScreen()); // navigate to your wanted page after logout.
  }
}
