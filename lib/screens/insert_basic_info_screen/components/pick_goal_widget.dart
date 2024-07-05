import 'package:fitness_tracker_app/common/color/my_colors.dart';
import 'package:fitness_tracker_app/common/extension/build_in_extension.dart';
import 'package:fitness_tracker_app/common/widgets/F_text.dart';
import 'package:fitness_tracker_app/screens/insert_basic_info_screen/insert_basic_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PickGoalWidget extends StatelessWidget {
  PickGoalWidget({super.key});

  final List goalsOption = [
    'get_fit',
    'be_stronger',
    'lost_weight',
    'get_muscle',
    'join_heroism',
    'other'
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.65,
      width: Get.width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.08),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: goalsOption
              .map((e) => SizedBox(
                  height: Get.height * 0.65 / 8, child: GoalOptionShow(e)))
              .toList(),
        ),
      ),
    );
  }
}

class GoalOptionShow extends GetView<InsertBasicInfoController> {
  const GoalOptionShow(this.goalLabel, {super.key});

  final String goalLabel;

  @override
  Widget build(BuildContext context) {
    Get.put(InsertBasicInfoController());
    return InkWell(
      onTap: () => controller.selectGoal(goalLabel),
      child: Obx(
        () => AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(18)),
            color: goalLabel == controller.goal.value
                ? MyColor.phosphorous
                : MyColor.white.withOpacity(0.4),
          ),
          child: Center(
            child: FText(
              goalLabel,
              fontWeight: FontWeight.bold,
              color: MyColor.white,
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}
