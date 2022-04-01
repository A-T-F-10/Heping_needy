import 'package:flutter/material.dart';
import 'package:holping_needy_project/core/utils/size_confg.dart';

Widget listInfoPlease({
  required Icon icon,
  required String title,
  required String yesOrNo,
  required double size,
}) {
  return ListTile(
      leading: icon,
      title: Text(title,
          style: TextStyle(fontSize: SizeConfig.defaultSize! * size)),
      trailing: Text(yesOrNo));
}
