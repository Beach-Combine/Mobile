import 'package:beach_combine/utils/app_style.dart';
import 'package:beach_combine/widgets/ranking_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AllTimeRankingScreen extends StatelessWidget {
  const AllTimeRankingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.whiteColor,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.only(top: 50),
                shrinkWrap: true,
                itemCount: 30,
                itemBuilder: ((context, index) {
                  final isMe = index == 5 ? true : false;
                  final name = index == 5 ? "Me" : "Nickname";
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
