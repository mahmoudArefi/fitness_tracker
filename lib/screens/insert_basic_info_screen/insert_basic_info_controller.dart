import 'package:get/get.dart';

class InsertBasicInfoController extends GetxController {
  RxInt index = 1.obs;
  Rx<Gender> selectedGender = Gender.male.obs;
  Rx<TrainMethod> trainMethod = TrainMethod.trainer.obs;

  RxString goal = ''.obs;

  selectGoal(String newGoal) {
    goal.value = newGoal;
  }

  onPrimaryButtonClick() {
    print('hi');
    index.value++;
  }

  onSecondaryButtonClick() {
    print('bye');
    index.value--;
  }
}

enum Gender { male, female }

enum TrainMethod { trainer, aiBot }
