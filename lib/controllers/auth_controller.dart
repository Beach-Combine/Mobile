import 'package:beach_combine/services/auth_service.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AuthController extends GetxController {
  final authService = AuthService();

  signInWithGoogle() {
    authService.signInWithGoogle();
  }
}
