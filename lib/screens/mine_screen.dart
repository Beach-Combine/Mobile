import 'package:beach_combine/utils/app_style.dart';
import 'package:flutter/material.dart';

import 'Ranking/month_ranking_screen.dart';

class MineScreen extends StatelessWidget {
  const MineScreen({super.key});

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
            title: Text("Mine", style: Styles.titleText),
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
                Tab(text: "Points"),
                Tab(text: "History"),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Center(
                child: Text('Points'),
              ),
              Center(
                child: Text('History'),
              ),
            ],
          )),
    );
  }
}
