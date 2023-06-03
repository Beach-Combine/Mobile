import 'package:beach_combine/models/certification_requests.dart';
import 'package:beach_combine/screens/Admin/certification_detail_screen.dart';
import 'package:beach_combine/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerificationRequestCard extends StatelessWidget {
  const VerificationRequestCard(
      {super.key, required this.certificationRequests});

  final CertificationRequests certificationRequests;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(CertificationDetailScreen(certificationRequest : certificationRequests));
      },
      child: Container(
          child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(90.0),
            child: Image.network(
              certificationRequests.memberImage,
              fit: BoxFit.fill,
              width: 54,
            ),
          ),
          SizedBox(
            width: 14,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                certificationRequests.nickname,
                style: Styles.body12Text,
              ),
              Text(
                certificationRequests.date,
                style: Styles.body3Text.copyWith(color: Styles.gray1Color),
              ),
            ],
          ),
          Spacer(),
          certificationRequests.isCertified
              ? Image.asset(
                  'assets/icons/admin_trashcan_checked.png',
                  width: 37,
                )
              : Image.asset(
                  'assets/icons/admin_trashcan_unchecked.png',
                  width: 37,
                ),
        ],
      )),
    );
  }
}
