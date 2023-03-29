import 'package:beach_combine/controllers/history_controller.dart';
import 'package:beach_combine/controllers/mine_controller.dart';
import 'package:beach_combine/widgets/badge_%20tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryListScreen extends StatelessWidget {
  HistoryListScreen({super.key});
  final controller = Get.put(HistoryContorller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height / 12, right: 12),
        child: FloatingActionButton(
          onPressed: () {
            controller.changeRoute();
          },
          elevation: 5,
          backgroundColor: Colors.white,
          child: Image.asset(
            "assets/icons/map.png",
            width: 30,
          ),
        ),
      ),
      body: SafeArea(
        child: Obx(() {
          final controller = Get.find<MineController>();
          return GridView.builder(
            padding: EdgeInsets.all(24),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 120,
                childAspectRatio: 4.5 / 9,
                crossAxisSpacing: 20,
                mainAxisSpacing: 10),
            itemCount: controller.gridRecords.length,
            itemBuilder: ((_, index) {
              final item = controller.gridRecords[index];
              return BadgeTile(
                record: item,
              );
            }),
          );
        }),
      ),
    );
  }
}
