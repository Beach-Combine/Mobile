import 'package:beach_combine/screens/Ranking/all_time_ranking_screen.dart';
import 'package:beach_combine/screens/Ranking/month_ranking_screen.dart';
import 'package:beach_combine/utils/app_style.dart';
import 'package:beach_combine/widgets/flat_tabbar.dart';
import 'package:beach_combine/widgets/round_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class RankingScreen extends StatefulWidget {
  const RankingScreen({super.key});

  @override
  State<RankingScreen> createState() => _RankingScreenState();
}

class _RankingScreenState extends State<RankingScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: false,
          title: Text("Ranking", style: Styles.titleText),
          backgroundColor: Styles.whiteColor,
          bottom: FlatTabBar(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Styles.gray1Color,
                  width: 2.0,
                ),
              ),
            ),
            tabBar: TabBar(
              controller: _tabController,
              isScrollable: false,
              indicatorColor: Styles.primaryColor,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 2,
              labelColor: Styles.primaryColor,
              unselectedLabelColor: Styles.gray1Color,
              labelStyle: Styles.body01Text,
              tabs: [
                Tab(text: "This month"),
                Tab(text: "All time"),
              ],
            ),
          ),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: [
            MonthRankingScreen(),
            AllTimeRankingScreen(),
          ],
        ));
  }
}
