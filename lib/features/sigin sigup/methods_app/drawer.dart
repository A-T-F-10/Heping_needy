import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:holping_needy_project/core/utils/colors.dart';
import 'package:holping_needy_project/core/utils/size_confg.dart';

Widget buildDrawer() {
  return Drawer(
    child: Column(children: [
      Container(
        height: SizeConfig.screenHeight! / 3,
        width: SizeConfig.screenWidth! * 5,
        decoration: BoxDecoration(
            color: ColorsTheme.darkPrimaryColor,
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(50))),
        // child: Stack(children: [Positioned(child: CircleAvatar())]),
      )
    ]),
  );
}
