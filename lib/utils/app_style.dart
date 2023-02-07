import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color primary = const Color(0xFF5cdeb7);

class Styles {
  static Color primaryColor = primary;
  static Color buttonBlackColor = const Color(0xFF171717);
  static Color buttonPrimaryColor = primary;
  static Color whiteColor = const Color(0xFFFFFFFF);
  static Color gray1Color = const Color(0xFFAfAfAf);
  static Color gray2Color = Color(0xFFd8d8d8);
  static Color gray3Color = Color(0xFFf4f4f4);
  static TextStyle titleText = GoogleFonts.poppins(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.24,
      height: 1.5,
      color: buttonBlackColor);
  static TextStyle body01Text = GoogleFonts.poppins(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      height: 1.5,
      letterSpacing: -0.24);
  static TextStyle body02Text = GoogleFonts.poppins(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      height: 1.5,
      letterSpacing: -0.24);
  static TextStyle body11Text = GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      height: 1.5,
      letterSpacing: -0.24);
  static TextStyle body12Text = GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 1.5,
      letterSpacing: -0.24);
  static TextStyle body21Text = GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.5,
      letterSpacing: -0.24);
  static TextStyle body3Text = GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      height: 1.5,
      letterSpacing: -0.24);
  static TextStyle detailText = GoogleFonts.poppins(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      height: 1.5,
      letterSpacing: -0.24);
  static TextStyle number1Text = TextStyle(
      fontFamily: 'SpoqaHanSansNeo',
      fontSize: 36,
      fontWeight: FontWeight.w700,
      height: 1.5,
      letterSpacing: -0.24);
  static TextStyle number2Text = TextStyle(
      fontFamily: 'SpoqaHanSansNeo',
      fontSize: 20,
      fontWeight: FontWeight.w700,
      height: 1.5,
      letterSpacing: -0.24);
  //static double bottomBarHeight;
}
