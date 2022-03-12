
import 'package:holping_needy_project/sharedpreferances/keys_sharedpreferances.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/models_sharedpreferances/model_sharedpreferances_signup1.dart';
import '../models/models_sharedpreferances/model_sharedpreferances_signup2.dart';

class SharedpreferancesSignup {
  Future saveData({SharedpreferancesSignup1? users1, SharedpreferancesSignup2? users2}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (users1 != null) {
      sharedPreferences.setString(
          KeysSharedpreferances.AGE, users1.age.toString());
      sharedPreferences.setString(
          KeysSharedpreferances.LOCATION, users1.location);
      sharedPreferences.setString(KeysSharedpreferances.TYPE, users1.type);
      sharedPreferences.setInt(KeysSharedpreferances.GENDER, users1.gender);
      sharedPreferences.setInt(
          KeysSharedpreferances.DISABILLITY, users1.disability);

    } else {
      sharedPreferences.setString(
          KeysSharedpreferances.USERNAME, users2!.userName.toString());
      sharedPreferences.setString(
          KeysSharedpreferances.EMAIL, users2.email.toString());
    }
  }

  static Future<String> getData(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String data = sharedPreferences.get(key).toString();

    return data;
  }
}
