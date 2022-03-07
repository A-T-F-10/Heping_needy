import 'package:holping_needy_project/localization/locale_provider.dart';

enum TKeys { login, password, search }

//TKeys.hello
extension TKeysExtention on TKeys {
  String get _string => toString().split('.')[1];

  String translate(context) {
    return LocalizationService.of(context).translate(_string) ?? '';
  }
}
