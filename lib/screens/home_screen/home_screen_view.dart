import 'package:fitness_tracker_app/common/assets_path/asset_image_path.dart';
import 'package:fitness_tracker_app/common/color/my_colors.dart';
import 'package:fitness_tracker_app/common/extension/build_in_extension.dart';
import 'package:fitness_tracker_app/screens/home_screen/component/day_picker.dart';
import 'package:fitness_tracker_app/screens/home_screen/component/show_today_muscles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'component/show_material_amount_goal.dart';
import 'home_screen_controller.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        ColorFiltered(
          colorFilter: ColorFilter.mode(MyColor.black.withOpacity(0.75), BlendMode.colorBurn),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(MyImage.homeScreenBackGround),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 0.08,
              ),
              DayPicker(testDays),
              ShowTodayMuscles(),
              MaterialGoalAmount()
            ],
          ),
        )
      ],
    ));
  }
}

final List<DayInfo> testDays =
    List.generate(31, (index) => DayInfo(_getDayName(index), (index + 8).toString()));

String _getDayName(int index) {
  // Replace with your logic to get day names (e.g., Mon, Tue, etc.)
  index = index % 7;
  switch (index) {
    case 0:
      return "Sun";
    case 1:
      return "Mon";
    case 2:
      return "Tue";
    case 3:
      return "Wed";
    case 4:
      return "Thu";
    case 5:
      return "Fri";
    case 6:
      return "Sat";
    default:
      return "";
  }
}

// - for the startTrain button try to make something like when telegram message deleted
