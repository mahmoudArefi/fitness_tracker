import 'package:fitness_tracker_app/common/extension/build_in_extension.dart';
import 'package:fitness_tracker_app/screens/insert_basic_info_screen/insert_basic_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../common/color/my_colors.dart';
import '../../../common/functions/shadow_function.dart';
import '../../../common/icon/my_icon.dart';
import '../../../common/widgets/F_text.dart';

class InsertBasicInfoButtons extends GetView<InsertBasicInfoController> {
  const InsertBasicInfoButtons(this.isPrimaryButton, {super.key});



  final bool isPrimaryButton;

  @override
  Widget build(BuildContext context) {
    Get.put(InsertBasicInfoController());
    return InkWell(
      onTap:()=> isPrimaryButton
          ? controller.onPrimaryButtonClick()
          : controller.onSecondaryButtonClick(),
      child: SizedBox(
        width: isPrimaryButton ? Get.width * 0.35 : Get.height * 0.06,
        height: Get.height * 0.06,
        child: LayoutBuilder(
          builder: (context, size) {
            Widget triangleIcon = Center(
              child: RotatedBox(
                quarterTurns: isPrimaryButton ? 0 : 2,
                child: SizedBox(
                  width: size.maxWidth * (isPrimaryButton ? 0.1 : 0.15),
                  height: size.maxHeight * (isPrimaryButton ? 0.4 : 0.65),
                  child: SvgPicture.string(
                    MyIcon.triangle,
                  ),
                ),
              ),
            );
            return Container(
              decoration: BoxDecoration(
                color: isPrimaryButton ? MyColor.phosphorous : MyColor.white,
                borderRadius:
                    isPrimaryButton ? BorderRadius.circular(30.0) : null,
                shape: isPrimaryButton ? BoxShape.rectangle : BoxShape.circle,
                boxShadow: applyShadowFromFourSides(isPrimaryButton
                    ? MyColor.shadow
                    : MyColor.white.withOpacity(0.4)),
              ),
              child: FittedBox(
                child: isPrimaryButton
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        // mainAxisSize: MainAxisSize.min,
                        children: [
                          if (isPrimaryButton)
                            FittedBox(
                              child: FText(
                                "Next",
                                color: MyColor.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ).sizedBox(
                                h: size.maxHeight * 0.9,
                                w: size.maxWidth * 0.34),
                          if (isPrimaryButton)
                            SizedBox(
                              width: size.maxWidth * 0.1,
                            ),
                          triangleIcon
                        ],
                      )
                    : triangleIcon.paddingOnly(right: size.maxWidth * 0.05),
              ),
            );
          },
        ),
      ),
    );
  }
}
