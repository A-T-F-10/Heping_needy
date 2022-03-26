import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holping_needy_project/core/utils/colors.dart';
import 'package:holping_needy_project/core/widgets/sigin_mathod.dart';
import 'package:holping_needy_project/localization/loale_lang/translation.dart';
import 'package:holping_needy_project/pages/homepage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String locale = 'ar';
    return GetMaterialApp(
      translations: Translation(),
      locale: Locale(locale),
      fallbackLocale: Locale(locale),
      debugShowCheckedModeBanner: false,
      theme: ColorsTheme.themeLight,
      scaffoldMessengerKey: Utils.messengerKey,
      home: HomePage(),
    );
  }
}
