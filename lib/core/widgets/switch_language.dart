
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:holping_needy_project/localization/loale_lang/app_long.dart';

class SwitchLanguageApp extends StatelessWidget {
  const SwitchLanguageApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String localeEn = 'en';
    String localeAr = 'ar';


    return GetBuilder<AppLang>(
        init: AppLang(),
        builder: (c) {
          return DropdownButton(
              items: [
                DropdownMenuItem(child: Text(localeEn), value:localeEn),
                DropdownMenuItem(
                  child: Text(localeAr),
                  value: localeAr,
                )
              ],
              value: c.appLang,
              onChanged: (v) {
                c.changelang(v.toString());
                Get.updateLocale(Locale(v.toString()));
              });
        });
  }
}
