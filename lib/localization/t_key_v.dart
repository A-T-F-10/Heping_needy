import 'package:holping_needy_project/localization/locale_provider.dart';

enum TKeys {
  login,
  password,
  search,
  home,
  signUp,
  aboutMe,
  malls,
  entertainmentAndOtherLorem,
  connectWithUs,
  aboutContainsPage,
  restaurantsAndCoffees,
  hotelsAndChalets,
  next,
  name,
  type,
  gender,
  welcome,
  userName,
  details,
  account,
  phoneNumber,
  email,
  no,
  passwordHint,
  userNameHint,
  isNotEmpty,
  yes,
  english,
  arabic,
  male,
  female,
  yourFamily,
  color,
  ok,
  close,
  info,
  loginError,
  enterEmailAddress,
  dateOfBirth,
  changeLanguages,
  save,
  invalidPassword,
  you,
}

//TKeys.hello
extension TKeysExtention on TKeys {
  String get _string => toString().split('.')[1];

  String translate(context) {
    return LocalizationService.of(context).translate(_string) ?? '';
  }
}
