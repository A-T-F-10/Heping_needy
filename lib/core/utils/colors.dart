import 'package:flutter/material.dart';

class ColorsTheme {
  static Color darkPrimaryColor = Color(0xFF00796B);
  static Color primaryColor = Color(0xFF009688);
  static Color secondColor = Color(0xFFD9D9D9);
  static Color lightPrimaryColor = Color(0xFFB2DFDB);
  static Color whiteColor = Color(0xFFFFFFFF);
  static Color blackColor = Color(0xFF212121);

  static ThemeData themeData = ThemeData(
      scaffoldBackgroundColor: secondColor,
      appBarTheme: AppBarTheme(color: darkPrimaryColor),
      primaryColor: darkPrimaryColor);
}
