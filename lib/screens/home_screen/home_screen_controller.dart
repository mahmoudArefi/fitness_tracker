import 'package:fitness_tracker_app/common/enums/muscles_type.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/icon/my_icon.dart';
import 'component/show_material_amount_goal.dart';

class HomeScreenController extends GetxController {
  Rx<DayInfo> selectedData = DayInfo('dayCode', '').obs;

  RxList<MuscleType> todayMuscles = <MuscleType>[].obs;
  final RxList<MaterialInfo> materialInfoList = <MaterialInfo>[].obs;

  onInit() async {
    super.onInit();
    await Future.delayed(Duration(seconds: 1));
    todayMuscles.addAll([MuscleType.chest, MuscleType.biceps]);
    materialInfoList.value = [
      MaterialInfo(icon: MyIcon.caloriesIcon, amount: '344', label: 'Burn calories'),
      MaterialInfo(icon: MyIcon.proteinIcon, amount: '180g', label: 'Take Protein'),
      MaterialInfo(icon: MyIcon.carbIcon, amount: '60 g', label: 'Take Carbs'),
      MaterialInfo(icon: MyIcon.fatIcon, amount: '24g', label: 'Lost Fat'),
    ];
  }

  onDaySelect(DayInfo day) {
    selectedData.value = day;
  }
}

class DayInfo {
  String dayCode, dayDate;

  DayInfo(this.dayCode, this.dayDate);
}
