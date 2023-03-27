import 'package:beach_combine/controllers/community_controller.dart';
import 'package:beach_combine/screens/community/select_to_write_screen.dart';
import 'package:beach_combine/utils/app_style.dart';
import 'package:beach_combine/widgets/post_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class CommunityScreen extends StatelessWidget {
  CommunityScreen({super.key});

  final controller = Get.put(CommunityController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
          backgroundColor: Styles.whiteColor,
          appBar: _FlatAppBar(
            appBar: AppBar(),
          ),
          body: Obx(
            () {
              if (controller.isLoading.value) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Styles.primaryColor,
                  ),
                );
              }
              if (controller.feedList.isEmpty) {
                return Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/empty_community.png',
                          width: MediaQuery.of(context).size.width / 5,
                        ),
                        Gap(12),
                        Text(
                          'There\'re no beachcombers\nwho wrote it yet.',
                          style: Styles.body02Text
                              .copyWith(color: Styles.gray1Color),
                          textAlign: TextAlign.center,
                        ),
                      ]),
                );
              }

              return ListView.builder(
                  padding: EdgeInsets.only(top: 50, bottom: 20),
                  itemCount: controller.feedList.length,
                  itemBuilder: (context, index) {
                    final feed = controller.feedList[index];
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: PostCard(
                          id: feed.id,
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
                  });
            },
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
