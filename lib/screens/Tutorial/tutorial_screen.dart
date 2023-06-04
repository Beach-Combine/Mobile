import 'package:beach_combine/common/beach_combine.dart';
import 'package:beach_combine/controllers/auth_controller.dart';
import 'package:beach_combine/utils/app_style.dart';
import 'package:beach_combine/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  final PageController controller = PageController(initialPage: 0);

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: controller,
        children: <Widget>[
          Image.asset('assets/tutorial/tutorial1.png', fit: BoxFit.cover),
          SizedBox(
            width: double.infinity,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  'assets/tutorial/tutorial2.png',
                  fit: BoxFit.cover,
                ),
                Positioned(
                  left: 0,
                  bottom: 24,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 0,
                          backgroundColor: Styles.primaryColor,
                          fixedSize: Size(double.infinity, 60)),
                      onPressed: () async {
                        final result =
                            await Get.find<AuthController>().tutorialComplete();
                        if (result) {
                          Get.offAll(BeachCombine());
                        }
                      },
                      child: Text(
                        "Let's start!",
                        style: Styles.body12Text.copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
