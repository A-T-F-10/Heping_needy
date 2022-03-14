import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:holping_needy_project/core/utils/colors.dart';
import 'package:holping_needy_project/core/widgets/switch_language.dart';
import 'package:holping_needy_project/localization/t_key_v.dart';
import 'package:holping_needy_project/sharedpreferances/keys_sharedpreferances.dart';
import 'package:holping_needy_project/sharedpreferances/sharedpreferances_users.dart';

class AboutContaintPage extends StatefulWidget {
  @override
  State<AboutContaintPage> createState() => _AboutContaintPageState();
}

class _AboutContaintPageState extends State<AboutContaintPage> {
  String user = '';

  bool change = true;

  @override
  Widget build(BuildContext context) {
    String currentLan='ar';
    String secondLan='en';

    SharedpreferancesSignup.getData(KeysSharedpreferances.USERNAME)
        .then((value) => user = value);
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.all(12),
          child: Center(
            child: customText(
                size: MediaQuery.of(context).size.height / 30,
                text: TKeys().home,
                color: ColorsTheme.darkPrimaryColor),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            customText(
                size: MediaQuery.of(context).size.height / 30,
                text: 'Audio Reader',
                color: ColorsTheme.darkPrimaryColor),
            Switch(
              value: change,
              onChanged: (c) {
              },
              focusColor: ColorsTheme.darkPrimaryColor,
              hoverColor: ColorsTheme.secondColor,
              activeColor: ColorsTheme.blackColor,
            ),
          ],
        ),
        customText(
            size: MediaQuery.of(context).size.height / 30,
            text: 'Language',
            color: ColorsTheme.darkPrimaryColor),
        SwitchLanguageApp()
      ],
    );
  }

  Widget customText({String text = '', double size = 15, Color? color}) {
    return Text(
      text,
      style: TextStyle(fontSize: size, color: color),
    );
  }
}
