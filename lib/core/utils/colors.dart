import 'package:flutter/material.dart';

class ColorsTheme {
  static Color darkPrimaryColor = Color(0xFF00796B);
  static Color primaryColor = Color(0xFF009688);
  static Color secondColor = Color(0xFFD9D9D9);
  static Color lightPrimaryColor = Color(0xFFB2DFD);
  static Color whiteColor = Color(0xFFFFFFFF);
  static Color blackColor = Color(0xFF212121);

  static ThemeData themeData = ThemeData.light().copyWith(
      timePickerTheme: TimePickerThemeData(
          backgroundColor: darkPrimaryColor,
          dialBackgroundColor: darkPrimaryColor,
          inputDecorationTheme:
              InputDecorationTheme(fillColor: darkPrimaryColor)),
      scaffoldBackgroundColor: secondColor,
      appBarTheme: AppBarTheme(color: darkPrimaryColor),
      primaryColor: darkPrimaryColor);

  static ThemeData themeDark = ThemeData.dark().copyWith(
      // timePickerTheme: TimePickerThemeData(
      //     backgroundColor: blackColor,
      //     dialBackgroundColor: blackColor,
      //     inputDecorationTheme: InputDecorationTheme(fillColor: blackColor)),
      // scaffoldBackgroundColor: blackColor,
      // appBarTheme: AppBarTheme(color: blackColor),
      primaryColor: blackColor);

  static ThemeData theme = ThemeData.dark().copyWith(
      timePickerTheme: TimePickerThemeData(
          backgroundColor: whiteColor,
          dialBackgroundColor: whiteColor,
          inputDecorationTheme: InputDecorationTheme(fillColor: whiteColor)),
      scaffoldBackgroundColor: whiteColor,
      appBarTheme: AppBarTheme(color: whiteColor),
      primaryColor: whiteColor);
}
