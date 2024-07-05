import 'package:fitness_tracker_app/common/assets_path/asset_image_path.dart';
import 'package:fitness_tracker_app/common/extension/build_in_extension.dart';
import 'package:fitness_tracker_app/screens/insert_basic_info_screen/components/main_buttons.dart';
import 'package:fitness_tracker_app/screens/insert_basic_info_screen/components/number_selecte_widget.dart';
import 'package:fitness_tracker_app/screens/insert_basic_info_screen/components/pick_goal_widget.dart';
import 'package:fitness_tracker_app/screens/insert_basic_info_screen/insert_basic_info_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../common/color/my_colors.dart';
import '../../common/icon/my_icon.dart';
import '../../common/widgets/F_text.dart';
import 'components/pick_training_method.dart';
import 'components/select_gender_widget.dart';

class InsertBasicInfoScreen extends StatelessWidget {
  const InsertBasicInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            InsertBasicInfoBackGround(),
            SwitchWidgets(),
            InsertBasicInfoFooter()
          ],
        ),
      ),
    );
  }
}

class InsertBasicInfoBackGround extends StatelessWidget {
  const InsertBasicInfoBackGround({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: Get.height,
        width: Get.width * 2,
        child: FittedBox(
            fit: BoxFit.fill,
            child: Image.asset(MyImage.insertDataScreenBackGround)));
  }
}

class SwitchWidgets extends GetView<InsertBasicInfoController> {
  SwitchWidgets({super.key});

  final List<Widget> myInfoWidgets = [
    const SelectedGender(),
    NumberList(NumberSelectorInput(
      numbers: List.generate(50, (index) => index + 16),
      controller: ScrollController(),
    )),
    NumberList(NumberSelectorInput(
      numbers: List.generate(50, (index) => index + 50),
      controller: ScrollController(),
    )),
    NumberList(NumberSelectorInput(
      numbers: List.generate(50, (index) => index + 150),
      controller: ScrollController(),
    )),
    PickGoalWidget(),
    PickTrainingMethod(),
  ];
  final List<String> titles = [
    'select_gender',
    'select_age'   ,
    'select_weight',
    'select_height',
    'select_goal'  ,
    'TEST'
  ];

  @override
  Widget build(BuildContext context) {
    Get.put(InsertBasicInfoController());
    return SizedBox(
        height: Get.height,
        width: Get.width,
        child: Obx(
          () {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: Get.height * 0.08),
                  child: SizedBox(
                    width: Get.width * 0.8,
                    height: Get.height * 0.1,
                    child: FittedBox(
                      child: FText(
                        titles[controller.index.value],
                        color: MyColor.textColor,
                      ),
                    ),
                  ),
                ),
                myInfoWidgets[controller.index.value],
              ],
            );
          },
        ));
  }
}

class InsertBasicInfoFooter extends StatelessWidget {
  const InsertBasicInfoFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
      child: Padding(
        padding: EdgeInsets.only(bottom: Get.height * 0.05),
        child: const Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InsertBasicInfoButtons(false),
              InsertBasicInfoButtons(true),
            ],
          ),
        ),
      ),
    );
  }
}
