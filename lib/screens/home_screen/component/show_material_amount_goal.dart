import 'package:fitness_tracker_app/common/color/my_colors.dart';
import 'package:fitness_tracker_app/common/extension/build_in_extension.dart';
import 'package:fitness_tracker_app/screens/home_screen/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/widgets/F_text.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MaterialGoalAmount extends GetView<HomeScreenController> {
  const MaterialGoalAmount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenController());

    return SizedBox(
      height: Get.height * 0.3,
      child: Obx(
        () => GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: Get.width * 0.01,
            mainAxisSpacing: Get.width * 0.01,
            crossAxisCount: 2,
            childAspectRatio: 3, // Adjust the aspect ratio as needed
          ),
          itemCount: controller.materialInfoList.length,
          itemBuilder: (context, index) {
            final materialInfo = controller.materialInfoList[index];
            return _MaterialAmountGoalShowWidget(materialInfo);
          },
        ),
      ),
    );
  }
}

class _MaterialAmountGoalShowWidget extends StatelessWidget {
  const _MaterialAmountGoalShowWidget(this.materialInfo, {super.key});

  final MaterialInfo materialInfo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: Get.height * 0.1,
        width: Get.width * 0.4,
        child: LayoutBuilder(
          builder: (context, size) => Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)), color: MyColor.shadow),
            child: Padding(
              padding: EdgeInsets.all(size.maxHeight * 0.06),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: MyColor.phosphorous),
                        child: Center(
                            child: FittedBox(
                          fit: BoxFit.fill,
                          child: SvgPicture.string(materialInfo.icon),
                        ).sizedBox(h: size.maxHeight * 0.4, w: size.maxWidth * 0.18)),
                      ).sizedBox(h: size.maxHeight * 0.45, w: size.maxWidth * 0.2),
                      FText(
                        materialInfo.amount,
                        color: MyColor.textColor,
                      ).sizedBox(h: size.maxHeight * 0.3, w: size.maxWidth * 0.5)
                    ],
                  ),
                  FText(
                    materialInfo.label,
                    color: MyColor.textColor,
                  ).sizedBox(h: size.maxHeight * 0.3, w: size.maxWidth * 0.6)
                ],
              ),
            ),
          ),
        ));
  }
}

class MaterialInfo {
  String icon, amount, label;

  MaterialInfo({required this.icon, required this.amount, required this.label});
}

// - fix the icon issue
// - make the bottom navigation bar
