import 'package:beach_combine/utils/app_style.dart';
import 'package:beach_combine/widgets/ranking_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class AllTimeRankingScreen extends StatelessWidget {
  const AllTimeRankingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      backgroundColor: Styles.whiteColor,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.only(
                    top: 50, bottom: MediaQuery.of(context).size.height / 9),
                shrinkWrap: true,
                itemCount: 30,
                itemBuilder: ((context, index) {
                  final isMe = index == 10 ? true : false;
                  final name = index == 10 ? "Me" : "Nickname";
                  return RankingCard(
                      nickname: name,
                      isMe: isMe,
                      path: 'assets/images/person4.png',
                      point: 3100,
                      index: index + 1);
                })),
          ),
        ],
      ),
    );
  }
}
