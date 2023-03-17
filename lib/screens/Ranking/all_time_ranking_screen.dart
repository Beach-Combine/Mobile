import 'package:beach_combine/controllers/ranking_controller.dart';
import 'package:beach_combine/utils/app_style.dart';
import 'package:beach_combine/widgets/ranking_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class AllTimeRankingScreen extends StatefulWidget {
  AllTimeRankingScreen({super.key});

  @override
  State<AllTimeRankingScreen> createState() => _AllTimeRankingScreenState();
}

class _AllTimeRankingScreenState extends State<AllTimeRankingScreen> {
  final scrollController = ScrollController();
  bool isLoading = false;
  final rankingcontroller = Get.find<RankingController>();

  @override
  void initState() {
    // TODO: implement initState
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        print('asdf');
        getData();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          extendBody: false,
          backgroundColor: Styles.whiteColor,
          body: Obx(
            () => rankingcontroller.allTimeRanking.isEmpty
                ? Center(
                    child: CircularProgressIndicator(
                      color: Styles.primaryColor,
                    ),
                  )
                : SingleChildScrollView(
                    controller: scrollController,
                    physics: ScrollPhysics(),
                    child: Column(
                      children: [
                        ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.only(top: 20, bottom: 20),
                            shrinkWrap: true,
                            itemCount: rankingcontroller.allTimeRanking.length,
                            itemBuilder: ((context, index) {
                              final ranker =
                                  rankingcontroller.allTimeRanking[index];
                              return RankingCard(
                                  nickname: ranker.nickname,
                                  isMe: false,
                                  path: ranker.image,
                                  point: ranker.point,
                                  index: index + 1);
                            })),
                        rankingcontroller.nextPage.value
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircularProgressIndicator(
                                  color: Styles.primaryColor,
                                ),
                              )
                            : Container()
                      ],
                    ),
                  ),
          )),
    );
  }

  getData() async {
    setState(() {
      isLoading = true;
    });
    await rankingcontroller.getAllRanking();
    setState(() {
      isLoading = false;
    });
  }
}
