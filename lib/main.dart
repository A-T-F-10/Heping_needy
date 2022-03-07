import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:holping_needy_project/features/sigin%20sigup/long_in.dart';

import 'pages/homepage.dart';
import 'pages/login.dart';
import 'pages/sign_up.dart';
import 'pages/sign_up2.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: Utils.messengerKey,
      home: DefaultTabController(length: 3,child: HomePage(),),
    );
  }
}


