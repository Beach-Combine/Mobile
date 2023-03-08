import 'package:get_storage/get_storage.dart';

mixin RecordManager {
  Future<bool> saveToken(String tokenKey, String? token) async {
    final box = GetStorage();
    await box.write(tokenKey, token);
    return true;
  }

  String? getToken(String tokenKey) {
    final box = GetStorage();
    return box.read(tokenKey);
  }

  Future<void> removeToken(String tokenKey) async {
    final box = GetStorage();
    await box.remove(tokenKey);
  }
}
