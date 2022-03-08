// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SHAREDPREFERENCES {
  var getKeyInt;
  var getKeyBool;

  SHAREDPREFERENCES({required this.getKeyInt, required this.getKeyBool});

  saveData(
      {required String keyInt,
      required String keyBool,
      required int valueInt,
      required bool valueBool}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt(keyInt, valueInt);
    sharedPreferences.setBool(keyBool, valueBool);
    debugPrint('Save Data :)');
  }

  getData({required String keyInt, required String keyBool}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    getKeyInt = sharedPreferences.getInt(keyInt);
    getKeyBool = sharedPreferences.getBool(keyBool);
    debugPrint('Get Data :)');
  }
}
