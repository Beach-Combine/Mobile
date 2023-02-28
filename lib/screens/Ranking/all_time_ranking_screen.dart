import 'package:beach_combine/utils/app_style.dart';
import 'package:beach_combine/widgets/ranking_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class AllTimeRankingScreen extends StatelessWidget {
  const AllTimeRankingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          extendBody: false,
          backgroundColor: Styles.whiteColor,
          body: ListView(
            children: [
              RankingCard(
                  nickname: 'Aiden',
                  isMe: false,
                  path: 'assets/images/Aiden.png',
                  point: 200000000,
                  index: 1),
              RankingCard(
                  nickname: 'Hudson',
                  isMe: false,
                  path: 'assets/images/Hudson.png',
                  point: 170000000,
                  index: 2),
              RankingCard(
                  nickname: 'Jessica',
                  isMe: false,
                  path: 'assets/images/Jessica2.png',
                  point: 110000000,
                  index: 3),
              RankingCard(
                  nickname: 'Catherine',
                  isMe: false,
                  path: 'assets/images/Catherine.png',
                  point: 100000000,
                  index: 4),
              RankingCard(
                  nickname: 'Charlotte',
                  isMe: false,
                  path: 'assets/images/Charlotte.png',
                  point: 80000000,
                  index: 5),
              RankingCard(
                  nickname: 'Florence',
                  isMe: false,
                  path: 'assets/images/Florence.png',
                  point: 20000000,
                  index: 6),
              RankingCard(
                  nickname: 'Isaac',
                  isMe: false,
                  path: 'assets/images/Isaac.png',
                  point: 6000000,
                  index: 7),
              RankingCard(
                  nickname: 'Me',
                  isMe: true,
                  path: 'assets/images/me.png',
                  point: 3000000,
                  index: 8),
              RankingCard(
                  nickname: 'Rosa',
                  isMe: false,
                  path: 'assets/images/person1.png',
                  point: 2000000,
                  index: 9),
            ],
          )
          // Column(
          //   children: [
          //     Expanded(
          //       child: ListView.builder(
          //           padding: EdgeInsets.only(top: 50, bottom: 20),
          //           shrinkWrap: true,
          //           itemCount: 30,
          //           itemBuilder: ((context, index) {
          //             final isMe = index == 10 ? true : false;
          //             final name = index == 10 ? "Me" : "Nickname";
          //             return RankingCard(
          //                 nickname: name,
          //                 isMe: isMe,
          //                 path: 'assets/images/person4.png',
          //                 point: 3100,
          //                 index: index + 1);
          //           })),
          //     ),
          //   ],
          // ),
          ),
    );
  }
}
