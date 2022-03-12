import 'package:flutter/material.dart';
import 'package:holping_needy_project/models/user_info/keys_sharedpreferances.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'user_info/users.dart';
import 'user_info/users2.dart';

class UserInfoProvider {
  UserInfoProvider();
  Users users = Users();
  Users2 users2 = Users2();

  saveData({required Users value}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(KeysSharedpreferances.AGE, value.age);
    sharedPreferences.setString(KeysSharedpreferances.LOCATION, value.location);
    sharedPreferences.setString(KeysSharedpreferances.TYPE, value.type);
    sharedPreferences.setInt(KeysSharedpreferances.GENDER, value.gender);
    sharedPreferences.setInt(
        KeysSharedpreferances.DISABILLITY, value.disability);

    debugPrint('Save Data :)');
  }

  Future<String> getData(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String data = sharedPreferences.get(key).toString();
    debugPrint('Get Data :)$data');
    return data;
  }
}
