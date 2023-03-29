import 'package:beach_combine/controllers/community_controller.dart';
import 'package:beach_combine/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class PostCard extends StatefulWidget {
  final int id;
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
    required this.id,
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

  calcLikes() {}

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CommunityController>();
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
                  backgroundImage: NetworkImage(widget.profilePath),
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
                        controller.deleteLike(widget.id);
                      } else {
                        _likes++;
                        _myLike = true;
                        controller.postLike(widget.id);
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
                Stack(
                  children: [
                    Container(
                      color: Styles.gray1Color,
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: MediaQuery.of(context).size.width / 2.5,
                    ),
                    Image.network(
                      fit: BoxFit.cover,
                      widget.beforePath,
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: MediaQuery.of(context).size.width / 2.5,
                    ),
                  ],
                ),
                Gap(8),
                Stack(
                  children: [
                    Container(
                      color: Styles.gray1Color,
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: MediaQuery.of(context).size.width / 2.5,
                    ),
                    Image.network(
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: MediaQuery.of(context).size.width / 2.5,
                      widget.afterPath,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
