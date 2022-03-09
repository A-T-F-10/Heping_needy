import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserInfoProvider {
  var emil;
  var userName;
  var whoHasaDisability;
  var gender;

  var keyEmil;
  var keyUserName;
  var keyWhoHasaDisability;
  var keyGender;

  var getEmil;
  var getUserName;
  var getWhoHasaDisability;
  var getGender;

  UserInfoProvider({
    required this.emil,
    required this.userName,
    required this.whoHasaDisability,
    required this.gender,
    required this.keyEmil,
    required this.keyUserName,
    required this.keyWhoHasaDisability,
    required this.keyGender,
    required this.getEmil,
    required this.getUserName,
    required this.getWhoHasaDisability,
    required this.getGender,
  });

  saveData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(keyEmil, emil);
    sharedPreferences.setString(keyUserName, userName);
    sharedPreferences.setString(keyWhoHasaDisability, whoHasaDisability);
    sharedPreferences.setString(keyGender, gender);
    debugPrint('Save Data :)');
  }

  getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    getEmil = sharedPreferences.getString(keyEmil);
    getUserName = sharedPreferences.getString(keyUserName);
    getWhoHasaDisability = sharedPreferences.getString(keyWhoHasaDisability);
    getGender = sharedPreferences.getString(keyGender);

    debugPrint('Get Data :)');
  }
}
