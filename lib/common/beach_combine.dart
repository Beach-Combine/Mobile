import 'package:beach_combine/screens/Home/home_screen.dart';
import 'package:beach_combine/screens/Home/map_screen.dart';
import 'package:beach_combine/screens/Home/cleaning_screen.dart';
import 'package:beach_combine/screens/Ranking/ranking_screen.dart';
import 'package:beach_combine/screens/community/community_screen.dart';
import 'package:beach_combine/screens/Mine/mine_screen.dart';
import 'package:beach_combine/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BeachCombine extends StatefulWidget {
  const BeachCombine({super.key});

  @override
  State<BeachCombine> createState() => _BeachCombineState();
}

class _BeachCombineState extends State<BeachCombine> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: _selectedIndex, // index 순서에 해당하는 child를 맨 위에 보여줌
        children: [
          MapScreen(),
          RankingScreen(),
          CommunityScreen(),
          MineScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        //height: MediaQuery.of(context).size.height / 10,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(24), topLeft: Radius.circular(24)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(24)),
          child: BottomNavigationBar(
            unselectedItemColor: Styles.gray2Color, // 선택되지 않은 아이콘 색상
            showSelectedLabels: true, // 선택된 항목 label 숨기기
            showUnselectedLabels: true, // 선택되지 않은 항목 label 숨기기
            type: BottomNavigationBarType.fixed, // 선택시 아이콘 움직이지 않기
            backgroundColor: Colors.white, //.withOpacity(0.8),
            selectedLabelStyle: GoogleFonts.poppins(),
            unselectedLabelStyle: GoogleFonts.poppins(),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("assets/icons/home.png"),
                  size: 18,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("assets/icons/ranking.png"),
                  size: 18,
                ),
                label: 'Ranking',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("assets/icons/community.png"),
                  size: 18,
                ),
                label: 'Community',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("assets/icons/mine.png"),
                  size: 18,
                ),
                label: 'Mine',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Styles.buttonBlackColor,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
