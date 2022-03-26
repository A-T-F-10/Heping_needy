import 'package:get/get.dart';
import 'package:holping_needy_project/core/utils/colors.dart';
import 'package:holping_needy_project/sharedpreferances/keys_sharedpreferances.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChengegetxController extends GetxController {
  double valueColors = 0;

  double valueSize = 0.0;

  double sizex = 1.5;

  double getSize = 1.5;
  double getValue = 0;

  void changerColor() {
    if (valueColors < 5) {
      Get.changeTheme(ColorsTheme.themeLight);
    } else if (valueColors == 5) {
      Get.changeTheme(ColorsTheme.theme);
    } else {
      Get.changeTheme(ColorsTheme.themeDark);
    }
    update();
  }

  void changerSize() {
    if (valueSize < 5) {
      sizex = 1.5;
      valueSize = 0;
    } else if (valueSize == 5) {
      sizex = 2.0;
      valueSize = 5;
    } else {
      sizex = 2.5;
      valueSize = 10;
    }

    update();
  }

  gett() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    getSize = preferences.getDouble(KeysSharedpreferances.SIZE)!;
    getValue = preferences.getDouble(KeysSharedpreferances.VALUE)!;
    // print('git : ${preferences.getDouble(KeysSharedpreferances.SIZE)!}');
  }
}
