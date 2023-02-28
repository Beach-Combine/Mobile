import 'package:beach_combine/utils/app_style.dart';
import 'package:beach_combine/widgets/flat_appbar.dart';
import 'package:beach_combine/widgets/selection_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class SelectToWriteScreen extends StatelessWidget {
  const SelectToWriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Styles.gray3Color,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(CupertinoIcons.back, color: Colors.black),
            onPressed: () {
              Get.back();
            },
          ),
          title: Text(
            "Select to write",
            style: Styles.body12Text.copyWith(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Styles.gray3Color,
          elevation: 0,
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: SelectionCard(
                isWritten: false,
                date: DateTime.utc(2022, 4, 5),
                location: "Gwangalli Beach",
                range: 6,
                time: "02:12:33",
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: SelectionCard(
                isWritten: true,
                date: DateTime.utc(2022, 4, 5),
                location: "Haeundae Beach",
                range: 12,
                time: "05:11:05",
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: SelectionCard(
                isWritten: false,
                date: DateTime.utc(2022, 4, 5),
                location: "Gwangalli Beach",
                range: 3,
                time: "00:53:19",
              ),
            )
          ],
        )
        // ListView.builder(
        //     padding: EdgeInsets.symmetric(vertical: 14),
        //     itemCount: 10,
        //     itemBuilder: ((context, index) {
        //       final isWritten = (index == 3 || index == 4) ? true : false;
        //       return Padding(
        //         padding:
        //             const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        //         child: SelectionCard(
        //           isWritten: isWritten,
        //           date: DateTime.utc(2022, 4, 5),
        //           location: "Gwangalli Beach",
        //           range: 100,
        //           time: "03:59:59",
        //         ),
        //       );
        //     }))
        );
  }
}
