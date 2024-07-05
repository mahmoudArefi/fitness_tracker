import 'package:fitness_tracker_app/common/color/my_colors.dart';
import 'package:fitness_tracker_app/common/extension/build_in_extension.dart';
import 'package:fitness_tracker_app/common/functions/shadow_function.dart';
import 'package:fitness_tracker_app/common/widgets/F_text.dart';
import 'package:fitness_tracker_app/screens/insert_basic_info_screen/insert_basic_info_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PickTrainingMethod extends GetView<InsertBasicInfoController> {
  const PickTrainingMethod({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(InsertBasicInfoController());
    return Padding(
      padding: EdgeInsets.only(top: Get.height * 0.2),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FText(
              'pick_train_method',
              color: MyColor.textColor,
              fontSize: 28,
            ),
            SizedBox(
              height: Get.height * 0.024,
            ),
            SizedBox(
              height: Get.height * 0.28,
              width: Get.width,
              child: Container(
                decoration: BoxDecoration(
                  color: MyColor.white.withOpacity(0.8),
                  borderRadius: const BorderRadius.all(Radius.circular(18)),
                  boxShadow:
                      applyShadowFromFourSides(MyColor.white.withOpacity(0.5)),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: Get.height * 0.0),
                  child: LayoutBuilder(
                    builder: (context, size) => Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.maxWidth * 0.05,
                          vertical: size.maxHeight * 0.1),
                      child: Stack(
                        children: [
                          Obx(
                            () => AnimatedPadding(
                              padding: EdgeInsets.only(
                                  top: size.maxHeight *
                                      (controller.trainMethod.value ==
                                              TrainMethod.trainer
                                          ? 0
                                          : 0.2)),
                              duration: const Duration(milliseconds: 200),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(
                                            controller.trainMethod.value ==
                                                    TrainMethod.aiBot
                                                ? 0
                                                : 18),
                                        bottom: Radius.circular(
                                            controller.trainMethod.value ==
                                                    TrainMethod.aiBot
                                                ? 18
                                                : 0)),
                                    color: MyColor.phosphorous),
                              ).setSize(size),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(18)),
                                border: Border.all(color: MyColor.black)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const FText(
                                  'with_trainer',
                                  fontSize: 20,
                                ).setSize(size, TrainMethod.trainer),
                                Container(
                                  height: size.maxHeight * 0.01,
                                  width: size.maxWidth,
                                  color: MyColor.black,
                                ),
                                const FText(
                                  'with_bot',
                                  fontSize: 20,
                                ).setSize(size, TrainMethod.aiBot),
                                Expanded(child: Container()),
                                const DoneButton(),
                                SizedBox(
                                  height: size.maxHeight * 0.05,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DoneButton extends StatelessWidget {
  const DoneButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text('start'),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(20.0), // Adjust the curve as needed
        ),
      ),
    );
  }
}

//- make this button

extension _PutStaticSize on Widget {
  setSize(BoxConstraints size, [TrainMethod? trainMethod]) {
    var controller = Get.put(InsertBasicInfoController());
    return InkWell(
      onTap: () {
        if (trainMethod == null) {
          return;
        }
        controller.trainMethod.value = trainMethod;
      },
      child: SizedBox(
        width: size.maxWidth,
        height: size.maxHeight * 0.2,
        child: Center(child: this),
      ),
    );
  }
}
