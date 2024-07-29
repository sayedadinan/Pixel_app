import 'package:flutter/material.dart';
import 'package:pixel_app/view/utils/constants/mediaquery.dart';
import 'package:pixel_app/view/utils/constants/paths.dart';


class CustomText extends StatelessWidget {
  final double size;
  final String text;
  final Color color;
  final FontWeight? weight;
  final TextAlign? textAlign;
  final String fontFamily;
  const CustomText(
      {super.key,
      required this.text,
      required this.fontFamily,
      required this.size,
      required this.color,
     this.textAlign,
      this.weight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          fontWeight: weight,
          
          fontFamily: fontFamily,
          color: color,
          fontSize: mediaquerywidth(size, context)),
    );
  }
}

class AppdecorText extends StatelessWidget {
  final double size;
  final String text;
  final Color color;
  final FontWeight? weight;
  const AppdecorText(
      {super.key,
      required this.text,
      required this.size,
      required this.color,
      this.weight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontWeight: weight,
          fontFamily: CustomFonts.inknut,
          color: color,
          fontSize: mediaquerywidth(size, context)),
    );
  }
}
