import 'package:fitness_tracker_app/common/assets_path/asset_image_path.dart';
import 'package:fitness_tracker_app/common/color/my_colors.dart';
import 'package:fitness_tracker_app/common/widgets/F_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/widgets/image_background.dart';

class HiScreen extends StatelessWidget {
  const HiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ImageBackground(MyImage.splashScreenBackGround),
        ],
      ),
    );
  }
}

class HiScreenMessage extends StatelessWidget {
  const HiScreenMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: Get.height * 0.08),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          height: Get.height * 0.45,
          width: Get.width * 0.9,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(18)),
                color: MyColor.myGreen.withOpacity(0.5)),
          ),
        ),
      ),
    );
  }
}
