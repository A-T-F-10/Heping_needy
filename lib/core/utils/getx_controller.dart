import 'package:get/get.dart';
import 'package:holping_needy_project/core/utils/colors.dart';

class ChengegetxController extends GetxController {
  double value = 0;
  double v = 0;

  void changerColor() {
    if (value < 5) {
      Get.changeTheme(ColorsTheme.themeData);
    } else if (value == 5) {
      Get.changeTheme(ColorsTheme.theme);
    } else {
      Get.changeTheme(ColorsTheme.themeDark);
    }

    update();
  }
}
