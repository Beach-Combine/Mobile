import 'package:beach_combine/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PostCard extends StatelessWidget {
  final String name;
  final String profilePath;
  final String beforePath;
  final String afterPath;
  final String location;
  final bool myLike;
  final int likes;
  final String comment;

  PostCard({
    super.key,
    required this.comment,
    required this.name,
    required this.profilePath,
    required this.beforePath,
    required this.afterPath,
    required this.location,
    required this.myLike,
    required this.likes,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      width: 326,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 21,
                backgroundImage: AssetImage(profilePath),
              ),
              Gap(14),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Gap(4),
                      Text(
                        name,
                        style: Styles.body12Text,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      ImageIcon(
                        AssetImage('assets/icons/card_location.png'),
                        color: Styles.gray1Color,
                      ),
                      Text(
                        location,
                        style: Styles.body3TextGray1,
                      )
                    ],
                  ),
                ],
              ),
              Spacer(),
              Image.asset(
                  myLike ? 'assets/icons/like.png' : 'assets/icons/unlike.png'),
              Gap(6),
              Text(
                "${likes}m",
                style: Styles.body12Text,
              ),
            ],
          ),
          Gap(12),
          Center(
              child: Text(
            comment,
            style: Styles.body21Text,
          )),
          Gap(12),
          Center(
            child: Row(
              children: [
                Image.asset(
                  beforePath,
                  height: 160,
                  width: 160,
                ),
                Gap(6),
                Image.asset(
                  afterPath,
                  height: 160,
                  width: 160,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
