import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holping_needy_project/localization/loale_lang/locale_storage.dart';

class AppLang extends GetxController {
  var appLang = 'en';
  @override
  void onInit() async {
    super.onInit();
    LocaleStorage localeStorage = LocaleStorage();
    appLang = await localeStorage.languageSelected == null
        ? 'ar'
        : await localeStorage.languageSelected;

    Get.updateLocale(Locale(appLang));
    update();
  }

  changelang(String type) async {
    LocaleStorage localeStorage = LocaleStorage();
    if (appLang == type) {
      return;
    }
    if (type == 'en') {
      appLang = 'en';
      localeStorage.saveLang('en');
    } else {
      appLang = 'ar';
      localeStorage.saveLang('ar');
    }

    update();
  }
}
