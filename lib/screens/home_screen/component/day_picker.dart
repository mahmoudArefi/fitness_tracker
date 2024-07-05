import 'package:fitness_tracker_app/common/color/my_colors.dart';
import 'package:fitness_tracker_app/common/color/my_colors.dart';
import 'package:fitness_tracker_app/common/extension/build_in_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widgets/F_text.dart';
import '../home_screen_controller.dart';

class DayPicker extends StatelessWidget {
  const DayPicker(this.days, {super.key});

  final List<DayInfo> days;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.1,
      width: Get.width,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
          days.length,
          (index) => SizedBox(
              width: Get.height * 0.11,
              height: Get.height * 0.1,
              child: DayPickerDayShowWidget(dayInfo: days[index])),
        ),
      ),
    );
  }
}

class DayPickerDayShowWidget extends GetView<HomeScreenController> {
  const DayPickerDayShowWidget({required this.dayInfo, super.key});

  final DayInfo dayInfo;

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenController());
    return InkWell(
      onTap: () => controller.onDaySelect(dayInfo),
      child: LayoutBuilder(
        builder: (context, size) {
          return Obx(() {
            bool isDaySelected = (dayInfo == controller.selectedData.value);
            return AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    isDaySelected ? MyColor.phosphorous : Colors.black.withOpacity(0.4),
                    isDaySelected ? MyColor.phosphorous : Colors.white.withOpacity(0.4),
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FText(
                    dayInfo.dayCode,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ).sizedBox(h: size.maxHeight * 0.4),
                  FText(
                    dayInfo.dayDate,
                    color: Colors.white,
                    fontSize: 18,
                  ).sizedBox(h: size.maxHeight * 0.4),
                ],
              ),
            );
          });
        },
      ),
    );
  }
}
