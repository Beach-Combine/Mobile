import 'package:beach_combine/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';

import 'common/beach_combine.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //추가
  await FlutterConfig.loadEnvVariables(); //추가
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beach-Combine',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Styles.primaryColor,
      ),
      home: const BeachCombine(),
    );
  }
}
