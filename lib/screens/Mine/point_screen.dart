import 'package:beach_combine/utils/app_style.dart';
import 'package:beach_combine/widgets/point_card.dart';
import 'package:flutter/material.dart';

class PointScreen extends StatefulWidget {
  const PointScreen({super.key});

  @override
  State<PointScreen> createState() => _PointScreenState();
}

class _PointScreenState extends State<PointScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.gray3Color,
      body: Column(children: [PointCard(point: 20000)]),
    );
  }
}
