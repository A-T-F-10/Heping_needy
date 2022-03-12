import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holping_needy_project/core/utils/colors.dart';
import 'package:holping_needy_project/core/widgets/sigin_mathod.dart';
import 'package:holping_needy_project/localization/locale_provider.dart';
import 'package:holping_needy_project/pages/homepage.dart';
import 'package:holping_needy_project/pages/login.dart';
import 'package:holping_needy_project/sharedpreferances/keys_sharedpreferances.dart';
import 'package:holping_needy_project/sharedpreferances/sharedpreferances_users.dart';

String? email;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await SharedpreferancesSignup.getData(KeysSharedpreferances.EMAIL)
      .then((value) => email = value);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print(email);
    return GetMaterialApp(
        theme: ColorsTheme.themeData,
        textDirection: TextDirection.ltr,
        supportedLocales: LocalizationService.supportedLocales,
        localizationsDelegates: LocalizationService.localizationsDelegate,
        localeResolutionCallback: LocalizationService.localeResolutionCallBack,
        scaffoldMessengerKey: Utils.messengerKey,
        home: HomePage()
        // LogIn(),
        );
  }
}
