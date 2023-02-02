import 'package:beach_combine/utils/app_style.dart';
import 'package:beach_combine/widgets/round_appbar.dart';
import 'package:flutter/material.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RoundAppBar(
        title: "Community",
        iconButton: IconButton(
          icon: ImageIcon(
            AssetImage("assets/icons/writing.png"),
            color: Styles.buttonBlackColor,
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
