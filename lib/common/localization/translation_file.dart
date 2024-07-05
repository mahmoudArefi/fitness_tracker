import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'hello': 'Hello',
          'switch_language': 'Switch to Arabic',
          'select_gender': 'Select Your Gender',
          'select_age': 'Enter your age',
          'select_weight': 'Enter Your Weight',
          'select_height': 'Enter your Height',
          'select_goal': 'Pick Your Goal',
          'pick_train_method': 'How Do Like To \nTrain',
          'with_trainer': 'with personal trainer',
          'with_bot' : 'with AI bot',
          'start' : 'Start',
        },
        'ar_AE': {
          'hello': 'مرحبا',
          'switch_language': 'التبديل إلى الإنجليزية',
        },
      };
}
