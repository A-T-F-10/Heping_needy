import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holping_needy_project/core/widgets/sigin_mathod.dart';
import 'package:holping_needy_project/localization/locale_provider.dart';
import 'package:holping_needy_project/pages/login.dart';

import 'pages/homepage.dart';
import 'pages/login.dart';
import 'pages/sign_up.dart';
import 'pages/sign_up2.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      supportedLocales: LocalizationService.supportedLocales,
      localizationsDelegates: LocalizationService.localizationsDelegate,
      localeResolutionCallback: LocalizationService.localeResolutionCallBack,
      scaffoldMessengerKey: Utils.messengerKey,

      home: DefaultTabController(length: 3,child: HomePage(),),
    );
  }
}


