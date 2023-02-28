import 'package:beach_combine/controllers/history_controller.dart';
import 'package:beach_combine/widgets/badge_%20tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryListScreen extends StatelessWidget {
  HistoryListScreen({super.key});
  final controller = Get.put(HistoryContorller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          GridView.builder(
            padding: EdgeInsets.all(24),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 120,
                childAspectRatio: 5 / 9,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: 20,
            itemBuilder: ((context, index) {
              return BadgeTile(
                  date: DateTime(2022, 10, 22), location: 'Gwangalli Beach');
            }),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 14,
                vertical: MediaQuery.of(context).size.width / 18),
            child: Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: () {
                    controller.changeRoute();
                  },
                  child: Container(
                    height: 52,
                    width: 52,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: Center(
                      child: ImageIcon(
                        AssetImage("assets/icons/map.png"),
                      ),
                    ),
                  ),
                )),
          ),
        ]),
      ),
    );
  }
}
