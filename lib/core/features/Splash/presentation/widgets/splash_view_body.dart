import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holping_needy_project/core/utils/getx_controller.dart';
import 'package:holping_needy_project/core/utils/size_confg.dart';
import 'package:holping_needy_project/core/widgets/sigin_mathod.dart';
import 'package:holping_needy_project/pages/homepage.dart';
import 'package:holping_needy_project/pages/log/login.dart';
import 'package:holping_needy_project/sharedpreferances/modle_get_date.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  Animation<double>? animation;
  AnimationController? animationController;

  double color = ModleGetDate.colors;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    animation = Tween<double>(begin: .3, end: 1).animate(animationController!);

    animationController?.repeat(reverse: true);
    goToNextView();
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetBuilder<ChengegetxController>(
      init: ChengegetxController(),
      builder: (controller) {
        controller.update();
        return Center(
          child: FadeTransition(
            opacity: animation!,
            child: Image.asset('assets/images/Logo.png'),
          ),
        );
      },
    );
  }

  void goToNextView() async {
    Future.delayed(const Duration(seconds: 6), () async {
      try {
        if (ModleGetDate.email != '' && ModleGetDate.password != '') {
          signinWithEmailandPass(context,
              email: ModleGetDate.email.trim(),
              password: ModleGetDate.password.trim());
          Get.offAll(const HomePage());
        } else {
          Get.offAll(const LogIn());
        }
      } catch (e) {
        print(e);
      }
    });
  }
}
// transition: Transition.native