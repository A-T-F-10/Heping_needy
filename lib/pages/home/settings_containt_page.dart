import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holping_needy_project/core/utils/colors.dart';
import 'package:holping_needy_project/core/utils/getx_controller.dart';
import 'package:holping_needy_project/core/utils/size_confg.dart';
import 'package:holping_needy_project/core/widgets/switch_language.dart';
import 'package:holping_needy_project/localization/t_key_v.dart';
import 'package:holping_needy_project/sharedpreferances/keys_sharedpreferances.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsContaintPage extends StatefulWidget {
  @override
  State<SettingsContaintPage> createState() => _SettingsContaintPageState();
}

class _SettingsContaintPageState extends State<SettingsContaintPage> {
  String user = '';

  bool change = true;
  String currentLan = 'ar';
  String secondLan = 'en';
  double vv = 0;

  save({double? size, double? value}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setDouble(KeysSharedpreferances.SIZE, size!);
    preferences.setDouble(KeysSharedpreferances.VALUE, value!);
    print('save');
  }

  gett() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    vv = preferences.getDouble(KeysSharedpreferances.SIZE)!;
    // getValue = preferences.getDouble(KeysSharedpreferances.VALUE)!;
    print('git : ${preferences.getDouble(KeysSharedpreferances.SIZE)!}');
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChengegetxController>(
      init: ChengegetxController(),
      builder: (controller) {
        print(vv);
        return ListView(
          children: [
            Container(
              padding: EdgeInsets.all(12),
              child: Center(
                child: customText(
                    size: SizeConfig.defaultSize! * controller.sizex,
                    text: TKeys().setting,
                    color: ColorsTheme.darkPrimaryColor),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customText(
                    size: MediaQuery.of(context).size.height / 30,
                    text: TKeys().reader,
                    color: ColorsTheme.darkPrimaryColor),
                Switch(
                  value: change,
                  onChanged: (c) {},
                  focusColor: ColorsTheme.darkPrimaryColor,
                  hoverColor: ColorsTheme.secondColor,
                  activeColor: ColorsTheme.blackColor,
                ),
              ],
            ),
            customText(
                size: MediaQuery.of(context).size.height / 30,
                text: TKeys().language,
                color: ColorsTheme.darkPrimaryColor),
            const SwitchLanguageApp(),
            customText(
                size: MediaQuery.of(context).size.height / 30,
                text: TKeys().fontSize,
                color: ColorsTheme.darkPrimaryColor),
            Slider(
              activeColor: ColorsTheme.darkPrimaryColor,
              inactiveColor: ColorsTheme.whiteColor,
              value: controller.valueSize,
              onChanged: (c) async {
                controller.valueSize = c;
                controller.changerSize();
                // print('test : ${controller.sizex}');
                save(size: controller.sizex, value: controller.valueSize);
              },
              divisions: 2,
              max: 10,
              min: 0,
              label: 'تكبير',
              thumbColor: ColorsTheme.blackColor,
            ),
            customText(
                size: MediaQuery.of(context).size.height / 30,
                text: TKeys().gradeColor,
                color: ColorsTheme.darkPrimaryColor),
            Slider(
              activeColor: ColorsTheme.darkPrimaryColor,
              inactiveColor: ColorsTheme.whiteColor,
              value: controller.valueColors,
              onChanged: (c) {
                controller.valueColors = c;
                controller.changerColor();
              },
              divisions: 2,
              max: 10,
              min: 0,
              label: 'درجة اللون',
              thumbColor: ColorsTheme.blackColor,
            ),
          ],
        );
      },
    );
  }

  Widget customText({String text = '', double size = 15, Color? color}) {
    return Text(
      text,
      style: TextStyle(fontSize: size, color: color),
    );
  }
}
