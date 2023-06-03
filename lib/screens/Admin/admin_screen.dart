import 'package:beach_combine/controllers/admin_controller.dart';
import 'package:beach_combine/widgets/verification_request_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminScreen extends StatelessWidget {
  AdminScreen({super.key});
  final AdminController adminCtrl = Get.put(AdminController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Obx(() {
            return adminCtrl.certificationRequests.isNotEmpty
                ? Column(
                    children: [
                      ListView.separated(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 16),
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final item = adminCtrl.certificationRequests[index];
                            return VerificationRequestCard(
                              certificationRequests: item,
                            );
                          },
                          separatorBuilder: (context, index) => SizedBox(
                                height: 16,
                              ),
                          itemCount: adminCtrl.certificationRequests.length)
                    ],
                  )
                : SizedBox();
          }),
        ),
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Image.asset(
        'assets/logo/logo_type_black.png',
        width: MediaQuery.of(context).size.width / 2.4,
      ),
    );
  }
}
