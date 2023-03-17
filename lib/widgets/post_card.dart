import 'package:beach_combine/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class PostCard extends StatefulWidget {
  final String name;
  final String profilePath;
  final String beforePath;
  final String afterPath;
  final String location;
  bool myLike;
  int likes;
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
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  late int _likes;
  late bool _myLike;
  @override
  void initState() {
    // TODO: implement initState
    _likes = widget.likes;
    _myLike = widget.myLike;
    super.initState();
  }

  calcLikes() {
    
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 21,
                  backgroundImage: AssetImage(widget.profilePath),
                ),
                Gap(14),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Gap(4),
                        Text(
                          widget.name,
                          style: Styles.body12Text,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        ImageIcon(
                          AssetImage('assets/icons/card_location.png'),
                          size: 15,
                          color: Styles.gray1Color,
                        ),
                        Gap(3),
                        Text(
                          widget.location,
                          style: Styles.body3Text
                              .copyWith(color: Styles.gray1Color),
                        )
                      ],
                    ),
                  ],
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (_myLike) {
                        _likes--;
                        _myLike = false;
                      } else {
                        _likes++;
                        _myLike = true;
                      }
                    });
                  },
                  child: Image.asset(
                    _myLike
                        ? 'assets/icons/like.png'
                        : 'assets/icons/unlike.png',
                    width: 20,
                  ),
                ),
                Gap(6),
                Text(
                  "${_likes}",
                  style: Styles.body12Text,
                )
              ],
            ),
            Gap(12),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                widget.comment,
                style: Styles.body21Text,
                textAlign: TextAlign.left,
              ),
            ),
            Gap(12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  fit: BoxFit.cover,
                  widget.beforePath,
                  width: 160,
                  height: 160,
                ),
                Gap(6),
                Image.network(
                  fit: BoxFit.cover,
                  width: 160,
                  height: 160,
                  widget.afterPath,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
