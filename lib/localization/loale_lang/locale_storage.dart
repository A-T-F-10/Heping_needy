import 'package:get_storage/get_storage.dart';

class LocaleStorage {

  saveLang(String lang) async {
    await GetStorage().write('lang', lang);
  }

  Future<String> get languageSelected async {
    return await GetStorage().read('lang');
  }
}