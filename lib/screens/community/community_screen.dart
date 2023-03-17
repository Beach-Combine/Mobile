import 'package:beach_combine/controllers/community_controller.dart';
import 'package:beach_combine/screens/community/select_to_write_screen.dart';
import 'package:beach_combine/utils/app_style.dart';
import 'package:beach_combine/widgets/post_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommunityScreen extends StatelessWidget {
  final controller = Get.put(CommunityController());

  CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
          backgroundColor: Styles.whiteColor,
          appBar: _FlatAppBar(
            appBar: AppBar(),
          ),
          // body: ListView(
          //   children: [
          //     Center(
          //       child: Padding(
          //         padding: const EdgeInsets.only(bottom: 16),
          //         child: PostCard(
          //           likes: 101,
          //           name: "Joy",
          //           comment:
          //               "There's nothing more satisfying than seeing a beach that was once littered with trash now clean and pristine.",
          //           myLike: true,
          //           profilePath: 'assets/images/Joy.png',
          //           location: "Gwangalli Beach",
          //           beforePath: "assets/images/AdobeStock_210419020.png",
          //           afterPath: "assets/images/after.png",
          //         ),
          //       ),
          //     ),
          //     Center(
          //       child: Padding(
          //         padding: const EdgeInsets.only(bottom: 16),
          //         child: PostCard(
          //           likes: 53,
          //           name: "James",
          //           comment:
          //               "I feel so much better knowing that I made a difference in preserving our beautiful beaches.",
          //           myLike: false,
          //           profilePath: 'assets/images/James.png',
          //           location: "Haeundae Beach",
          //           beforePath: "assets/images/before_1.jpeg",
          //           afterPath: "assets/images/after_1.jpeg",
          //         ),
          //       ),
          //     ),
          //     Center(
          //       child: Padding(
          //         padding: const EdgeInsets.only(bottom: 16),
          //         child: PostCard(
          //           likes: 122,
          //           name: "Lia",
          //           comment:
          //               "It not only benefits the environment but also benefits your own well-being.",
          //           myLike: true,
          //           profilePath: 'assets/images/person4.png',
          //           location: "Gwangalli Beach",
          //           beforePath: "assets/images/before_2.jpeg",
          //           afterPath: "assets/images/after_2.jpeg.webp",
          //         ),
          //       ),
          //     ),
          //     Center(
          //       child: Padding(
          //         padding: const EdgeInsets.only(bottom: 16),
          //         child: PostCard(
          //           likes: 11,
          //           name: "Rora",
          //           comment:
          //               "Join me in this effort to keep our beaches clean and beautiful for generations to come!",
          //           myLike: false,
          //           profilePath: 'assets/images/person1.png',
          //           location: "Haeundae Beach",
          //           beforePath: "assets/images/before_3.jpeg",
          //           afterPath: "assets/images/after_3.png",
          //         ),
          //       ),
          //     ),
          //   ],
          // )
          body: Obx(
            () => controller.feedList.isEmpty
                ? Center(
                    child: CircularProgressIndicator(
                      color: Styles.primaryColor,
                    ),
                  )
                : ListView.builder(
                    padding: EdgeInsets.only(top: 50, bottom: 20),
                    itemCount: controller.feedList.length,
                    itemBuilder: (context, index) {
                      final feed = controller.feedList[index];
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: PostCard(
                            likes: feed.like,
                            name: feed.nickname,
                            comment: feed.review!,
                            myLike: feed.preferred,
                            profilePath: 'assets/images/person4.png',
                            location: feed.beachName,
                            beforePath: feed.beforeImage,
                            afterPath: feed.afterImage,
                          ),
                        ),
                      );
                    }),
          )),
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
