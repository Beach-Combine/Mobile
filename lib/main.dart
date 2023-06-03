import 'package:beach_combine/common/splash_screen.dart';
import 'package:beach_combine/utils/app_style.dart';
import 'package:beach_combine/utils/token_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';
import 'firebase_options.dart';

import 'common/beach_combine.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget with TokenManager {
  MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Styles.primaryColor, fontFamily: "SpoqaHanSansNeo"),
      // initialRoute: getToken(ACCESS_TOKEN_KEY) == null ? '/home' : '/login',
      // getPages: [
      //   GetPage(name: '/login', page: () => LoginScreen()),
      //   GetPage(name: '/home', page: () => BeachCombine()),
      //   GetPage(name: '/community', page: () => CommunityScreen()),
      // ],
      home: SplashScreen(),
    );
  }
}
