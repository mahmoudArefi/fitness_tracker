import 'package:fitness_tracker_app/common/color/my_colors.dart';
import 'package:fitness_tracker_app/common/extension/build_in_extension.dart';
import 'package:fitness_tracker_app/common/widgets/F_text.dart';
import 'package:fitness_tracker_app/screens/insert_basic_info_screen/insert_basic_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../common/icon/my_icon.dart';

class SelectedGender extends StatelessWidget {
  const SelectedGender({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Get.height * 0.05),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children:
            Gender.values.map((e) => GenderOptionWidgetSelect(e)).toList(),
      ),
    );
  }
}

class GenderOptionWidgetSelect extends GetView<InsertBasicInfoController> {
  const GenderOptionWidgetSelect(this.gender, {super.key});

  final Gender gender;

  @override
  Widget build(BuildContext context) {
    Get.put(InsertBasicInfoController());
    return SizedBox(
      height: Get.height * 0.28,
      width: Get.height * 0.28,
      child: InkWell(
        onTap: (() => controller.selectedGender.value = gender),
        child: Obx(
          () {
            bool isGenderSelected = controller.selectedGender.value == gender;
            return LayoutBuilder(
              builder: (context, size) => AnimatedPadding(
                duration: Duration(milliseconds: 200),
                padding:
                    EdgeInsets.all(isGenderSelected ? 0 : size.maxWidth * 0.05),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                    color: isGenderSelected
                        ? MyColor.phosphorous
                        : MyColor.white.withOpacity(0.65),
                    shape: BoxShape.circle,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.string(gender.name == 'male'
                          ? MyIcon.maleIcon
                          : MyIcon.femaleIcon),
                      FText(
                        gender.name,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
