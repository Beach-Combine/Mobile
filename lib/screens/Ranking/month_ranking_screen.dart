import 'package:beach_combine/utils/app_style.dart';
import 'package:beach_combine/widgets/top_ranker_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class MonthRankingScreen extends StatelessWidget {
  const MonthRankingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
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
                      rankerPath: 'assets/images/person1.png',
                      nickname: "Rora",
                      point: 1432141),
                  TopRankerCard(
                      width: 46,
                      rankerPath: 'assets/images/sungkyum.jpg',
                      nickname: "Sungkyum",
                      point: 1000000000),
                  TopRankerCard(
                      width: 40,
                      rankerPath: 'assets/images/person3.png',
                      nickname: "Eva",
                      point: 22313),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
