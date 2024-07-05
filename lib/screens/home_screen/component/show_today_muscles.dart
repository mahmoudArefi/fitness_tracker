import 'package:fitness_tracker_app/common/assets_path/asset_image_path.dart';
import 'package:fitness_tracker_app/common/color/my_colors.dart';
import 'package:fitness_tracker_app/common/enums/muscles_type.dart';
import 'package:fitness_tracker_app/common/extension/build_in_extension.dart';
import 'package:fitness_tracker_app/common/widgets/F_text.dart';
import 'package:fitness_tracker_app/screens/home_screen/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowTodayMuscles extends GetView<HomeScreenController> {
  const ShowTodayMuscles({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenController());
    return SizedBox(
      width: double.infinity,
      child: Obx(
        () => Column(
          children: controller.todayMuscles.map((element) => _TodayMuscleShow(element)).toList(),
        ) ,
      ),
    );
  }
}

class _TodayMuscleShow extends StatelessWidget {
  const _TodayMuscleShow(this.muscleType, {super.key});

  final MuscleType muscleType;

  getRightImage() {
    return switch (muscleType) {
      // TODO: Handle this case.
      MuscleType.biceps => MyImage.biceps,
      // TODO: Handle this case.
      MuscleType.triceps => MyImage.triceps,
      // TODO: Handle this case.
      MuscleType.chest => MyImage.chest,
      // TODO: Handle this case.
      MuscleType.shoulder => MyImage.shoulder,
      // TODO: Handle this case.
      MuscleType.leg => MyImage.legs,
      // TODO: Handle this case.
      MuscleType.back => MyImage.back,
    };
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.22,
      width: Get.width * 0.8,
      child: LayoutBuilder(
        builder: (context, size) => Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Stack(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset(
                    getRightImage(),
                    fit: BoxFit.cover,
                  ).sizedBox(h: size.maxHeight, w: size.maxWidth)),
              Align(
                alignment: const Alignment(-0.9, 0.9),
                child: FText(
                  muscleType.name,
                  color: MyColor.textColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}



 //- add image for every muscle
