import 'package:beach_combine/screens/community/select_to_write_screen.dart';
import 'package:beach_combine/utils/app_style.dart';
import 'package:beach_combine/widgets/post_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: Styles.whiteColor,
        appBar: _FlatAppBar(
          appBar: AppBar(),
        ),
        body: ListView.builder(
            padding: EdgeInsets.only(top: 50, bottom: 20),
            itemCount: 10,
            itemBuilder: (context, index) {
              final myLike = index == 0 ? true : false;
              final likes = index == 0 ? 999 : 100;
              return Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: PostCard(
                    likes: likes,
                    name: "Nickname",
                    comment:
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                    myLike: myLike,
                    profilePath: 'assets/images/person4.png',
                    location: "Gwangalli Beach",
                    beforePath: "assets/images/AdobeStock_210419020.png",
                    afterPath: "assets/images/after.png",
                  ),
                ),
              );
            }),
      ),
    );
  }
}

class _FlatAppBar extends StatelessWidget with PreferredSizeWidget {
  final AppBar appBar;

  const _FlatAppBar({
    required this.appBar,
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Community",
          style: Styles.titleText,
        ),
        actions: [
          IconButton(
            icon: ImageIcon(
              AssetImage("assets/icons/writing.png"),
              color: Styles.buttonBlackColor,
            ),
            onPressed: () {
              Get.to(SelectToWriteScreen());
            },
          ),
        ]);
  }
}
