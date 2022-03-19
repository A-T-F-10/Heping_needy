import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/list_notifier.dart';
import 'package:holping_needy_project/core/utils/colors.dart';
import 'package:holping_needy_project/core/utils/getx_controller.dart';
import 'package:holping_needy_project/core/widgets/switch_language.dart';
import 'package:holping_needy_project/localization/t_key_v.dart';
import 'package:holping_needy_project/sharedpreferances/keys_sharedpreferances.dart';
import 'package:holping_needy_project/sharedpreferances/sharedpreferances_users.dart';

class SettingsContaintPage extends StatefulWidget {
  @override
  State<SettingsContaintPage> createState() => _SettingsContaintPageState();
}

class _SettingsContaintPageState extends State<SettingsContaintPage> {
  String user = '';
  double valueChange = 0;
  double valueChange2 = 0;

  bool change = true;

  @override
  Widget build(BuildContext context) {
    String currentLan = 'ar';
    String secondLan = 'en';

    SharedpreferancesSignup.getData(KeysSharedpreferances.USERNAME)
        .then((value) => user = value);
    return GetBuilder<ChengegetxController>(
      init: ChengegetxController(),
      builder: (controller) => ListView(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            child: Center(
              child: customText(
                  size: MediaQuery.of(context).size.height / 30,
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
          SwitchLanguageApp(),
          customText(
              size: MediaQuery.of(context).size.height / 30,
              text: TKeys().fontSize,
              color: ColorsTheme.darkPrimaryColor),
          Slider(
            activeColor: ColorsTheme.darkPrimaryColor,
            inactiveColor: ColorsTheme.whiteColor,
            value: valueChange,
            onChanged: (c) {
              setState(() {
                changerFontSize();
              });
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
            value: controller.value,
            onChanged: (c) {
              controller.value = c;
              controller.changerColor();
            },
            divisions: 2,
            max: 10,
            min: 0,
            label: 'درجة اللون',
            thumbColor: ColorsTheme.blackColor,
          ),
        ],
      ),
    );
  }

  Widget customText({String text = '', double size = 15, Color? color}) {
    return Text(
      text,
      style: TextStyle(fontSize: size, color: color),
    );
  }

  void changerFontSize() {
    if (valueChange <= 6) {
      valueChange = valueChange + 2;
    } else {
      valueChange = 0;
    }
  }
}
