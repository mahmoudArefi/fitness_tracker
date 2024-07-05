import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageBackground extends StatelessWidget {
  const ImageBackground(this.imagePath,{super.key});

  final String imagePath ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: Get.height,
        width: Get.width,
        child: Image.asset(imagePath),
    );
  }
}
