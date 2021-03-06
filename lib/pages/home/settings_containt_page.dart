import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holping_needy_project/core/utils/colors.dart';
import 'package:holping_needy_project/core/utils/getx_controller.dart';
import 'package:holping_needy_project/core/utils/size_confg.dart';
import 'package:holping_needy_project/core/widgets/switch_language.dart';
import 'package:holping_needy_project/localization/t_key_v.dart';
import 'package:holping_needy_project/sharedpreferances/keys_sharedpreferances.dart';
import 'package:holping_needy_project/sharedpreferances/modle_get_date.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsContaintPage extends StatefulWidget {
  const SettingsContaintPage({Key? key}) : super(key: key);

  @override
  State<SettingsContaintPage> createState() => _SettingsContaintPageState();
}

class _SettingsContaintPageState extends State<SettingsContaintPage> {
  String secondLan = 'en';
  String currentLan = 'ar';
  String user = '';
  double size = ModleGetDate.size;
  double getDate = ModleGetDate.value;

  Future save({double? size, double? value, double? theme}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setDouble(KeysSharedpreferances.SIZE, size!);
    preferences.setDouble(KeysSharedpreferances.THEME, theme!);
    preferences.setDouble(KeysSharedpreferances.VALUE, value!);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChengegetxController>(
      init: ChengegetxController(),
      builder: (controller) {
        return ListView(
          children: [
            Container(
              padding: EdgeInsets.all(12),
              child: Center(
                child: customText(
                  size: SizeConfig.defaultSize! * controller.sizex,
                  text: TKeys().setting,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customText(
                  size: SizeConfig.defaultSize! * controller.sizex,
                  text: TKeys().reader,
                ),
                Switch(
                  value: controller.chengeView,
                  onChanged: (c) {
                    controller.chengeViews();
                  },
                ),
              ],
            ),
            customText(
                size: SizeConfig.defaultSize! * controller.sizex,
                text: TKeys().language,
                color: ColorsTheme.darkPrimaryColor),
            const SwitchLanguageApp(),
            customText(
              size: SizeConfig.defaultSize! * controller.sizex,
              text: TKeys().fontSize,
            ),
            Slider(
              value: controller.valueSize,
              onChanged: (c) async {
                controller.valueSize = c;
                if (c == 0) {
                  size = 2;
                } else if (c == 5) {
                  size = 2.5;
                } else if (c == 10) {
                  size = 3;
                }
                controller.changerSize();
              },
              divisions: 2,
              max: 10,
              min: 0,
              label: '??????????',
            ),
            customText(
              size: SizeConfig.defaultSize! * controller.sizex,
              text: TKeys().gradeColor,
            ),
            Slider(
              value: controller.valueColors,
              onChanged: (c) {
                controller.valueColors = c;
                controller.changerColor();
              },
              divisions: 2,
              max: 10,
              min: 0,
              label: '???????? ??????????',
            ),
          ],
        );
      },
      dispose: (dispose) {
        save(
            theme: dispose.controller!.valueColors,
            size: dispose.controller!.sizex,
            value: dispose.controller!.valueSize);
        print("${dispose.controller!.sizex}  dispose");
        ModleGetDate().gett();
      },
    );
  }

  Widget customText({String text = '', required double size, Color? color}) {
    return Text(
      text,
      style: TextStyle(fontSize: size, color: color),
    );
  }
}
