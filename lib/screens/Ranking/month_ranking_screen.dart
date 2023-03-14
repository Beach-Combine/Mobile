import 'package:beach_combine/controllers/ranking_controller.dart';
import 'package:beach_combine/utils/app_style.dart';
import 'package:beach_combine/widgets/ranking_card.dart';
import 'package:beach_combine/widgets/top_ranker_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class MonthRankingScreen extends StatelessWidget {
  MonthRankingScreen({super.key});
  final controller = Get.put(RankingController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Styles.whiteColor,
        body: Obx(() => controller.monthlyRanking.isNotEmpty
            ? SingleChildScrollView(
                physics: ScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Text('Best Beachcomber', style: Styles.titleText),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TopRankerCard(
                          width: 40,
                          rankerPath: controller.monthlyRanking[1].image,
                          nickname: controller.monthlyRanking[1].nickname,
                          point: controller.monthlyRanking[1].point,
                          rank: 2,
                        ),
                        TopRankerCard(
                          width: 46,
                          rankerPath: controller.monthlyRanking[0].image,
                          nickname: controller.monthlyRanking[0].nickname,
                          point: controller.monthlyRanking[0].point,
                          rank: 1,
                        ),
                        TopRankerCard(
                          width: 40,
                          rankerPath: controller.monthlyRanking[2].image,
                          nickname: controller.monthlyRanking[2].nickname,
                          point: controller.monthlyRanking[2].point,
                          rank: 3,
                        ),
                      ],
                    ),
                    Gap(20),
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.monthlyRanking.length - 3,
                        itemBuilder: (context, index) {
                          final i = index + 3;
                          final ranker = controller.monthlyRanking[i];
                          return RankingCard(
                              nickname: ranker.nickname,
                              isMe: false,
                              path: ranker.image,
                              point: ranker.point,
                              index: i + 1);
                        }
                        // children: [
                        //   RankingCard(
                        //       nickname: "Me",
                        //       isMe: true,
                        //       path: 'assets/images/me.png',
                        //       point: 15700,
                        //       index: 4),
                        //   RankingCard(
                        //       nickname: "Robert",
                        //       isMe: false,
                        //       path: 'assets/images/Robert.png',
                        //       point: 12400,
                        //       index: 5),
                        //   RankingCard(
                        //       nickname: "Jessica",
                        //       isMe: false,
                        //       path: 'assets/images/Jessica.png',
                        //       point: 11800,
                        //       index: 6),
                        //   RankingCard(
                        //       nickname: "Christina",
                        //       isMe: false,
                        //       path: 'assets/images/Christina.png',
                        //       point: 9200,
                        //       index: 7),
                        //   RankingCard(
                        //       nickname: "Joy",
                        //       isMe: false,
                        //       path: 'assets/images/Joy.png',
                        //       point: 9000,
                        //       index: 8),
                        //   RankingCard(
                        //       nickname: "James",
                        //       isMe: false,
                        //       path: 'assets/images/James.png',
                        //       point: 8010,
                        //       index: 9),
                        //   RankingCard(
                        //       nickname: "Lia",
                        //       isMe: false,
                        //       path: 'assets/images/person4.png',
                        //       point: 6000,
                        //       index: 10),
                        // ],
                        )
                  ],
                ))
            : Center(
                child: CircularProgressIndicator(color: Styles.primaryColor),
              )),
      ),
    );
  }
}
