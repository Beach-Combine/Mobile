import 'package:beach_combine/screens/Ranking/month_ranking_screen.dart';
import 'package:beach_combine/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class RankingScreen extends StatelessWidget {
  const RankingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(24.0),
              ),
            ),
            centerTitle: false,
            title: Text("Ranking", style: Styles.titleText),
            backgroundColor: Styles.primaryColor,
            bottom: TabBar(
              isScrollable: false,
              indicatorColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 2,
              labelColor: Colors.black,
              unselectedLabelColor: Styles.whiteColor,
              labelStyle: Styles.body01Text,
              tabs: [
                Tab(text: "This month"),
                Tab(text: "All time"),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              MonthRankingScreen(),
              Center(
                child: Text('All time'),
              ),
            ],
          )),
    );
  }
}
