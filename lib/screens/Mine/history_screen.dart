import 'package:beach_combine/controllers/history_controller.dart';
import 'package:beach_combine/screens/Mine/history_list_screen.dart';
import 'package:beach_combine/screens/Mine/history_map_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryScreen extends StatelessWidget {
  HistoryScreen({super.key});
  final controller = Get.put(HistoryContorller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<HistoryContorller>(
      builder: (controller) {
        if (controller.historyRoute == "MAP") {
          return HistoryMapScreen();
        } else {
          return HistoryListScreen();
        }
      },
    ));
  }
}
