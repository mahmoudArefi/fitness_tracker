import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FText extends StatelessWidget {
  const FText(this.text,
      {this.fontSize, this.color, this.fontFamily, this.fontWeight, super.key});

  final String text;
  final double? fontSize;
  final Color? color;
  final String? fontFamily;

  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text.tr,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontFamily: fontFamily ?? 'sitka',
        fontWeight: fontWeight,
      ),
    );
  }
}
