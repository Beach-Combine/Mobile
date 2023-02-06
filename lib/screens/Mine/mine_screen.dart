import 'package:beach_combine/screens/Mine/history_screen.dart';
import 'package:beach_combine/screens/Mine/point_screen.dart';
import 'package:beach_combine/screens/Mine/setting_screen.dart';
import 'package:beach_combine/utils/app_style.dart';
import 'package:beach_combine/widgets/flat_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MineScreen extends StatefulWidget {
  const MineScreen({super.key});

  @override
  State<MineScreen> createState() => _MineScreenState();
}

class _MineScreenState extends State<MineScreen> with TickerProviderStateMixin {
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
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GestureDetector(
                onTap: () {
                  Get.to(SettingScreen());
                },
                child: ImageIcon(
                  AssetImage("assets/icons/settings.png"),
                  color: Styles.buttonBlackColor,
                  size: 25,
                ),
              ),
            ),
          ],
          elevation: 0,
          centerTitle: false,
          title: Text("Mine", style: Styles.titleText),
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
                Tab(text: "Points"),
                Tab(text: "History"),
              ],
            ),
          ),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: [
            PointScreen(),
            HistoryScreen(),
          ],
        ));
  }
}
