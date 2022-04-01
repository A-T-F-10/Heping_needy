import 'package:holping_needy_project/sharedpreferances/keys_sharedpreferances.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ModleGetDate {
  String? themeData;
  static double size = 0.0;
  static double value = 0.0;
  static double colors = 0.0;

  Future gett() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    size = preferences.getDouble(KeysSharedpreferances.SIZE)!;
    colors = preferences.getDouble(KeysSharedpreferances.THEME)!;
    value = preferences.getDouble(KeysSharedpreferances.VALUE)!;
  }
}
