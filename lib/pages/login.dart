import 'package:flutter/material.dart';
import 'package:holping_needy_project/core/utils/size_confg.dart';
import 'package:holping_needy_project/core/widgets/sigin_mathod.dart';
import 'package:holping_needy_project/features/sigin%20sigup/widgets/textFormField.dart';
import 'package:holping_needy_project/localization/t_key_v.dart';
import 'package:holping_needy_project/models/sharedpreferances_users.dart';
import 'package:holping_needy_project/models/user_info/keys_sharedpreferances.dart';
import 'package:holping_needy_project/pages/home_containt_page.dart';
import 'package:holping_needy_project/pages/homepage.dart';
import 'package:holping_needy_project/pages/sign_up.dart';

import '../core/utils/colors.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => LogInState();
}

class LogInState extends State<LogIn> {
  TextEditingController email = TextEditingController();
  TextEditingController passward = TextEditingController();
  @override
  void initState() {
    UserInfoProvider()
        .getData(KeysSharedpreferances.EMAIL)
        .then((value) => print(value));
    super.initState();
  }

  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        key: globalKey,
        backgroundColor: ColorsTheme.secondColor,
        appBar: AppBar(
          title: Text(
            TKeys.login.translate(context),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                child: Image.asset(
                  'assets/images/Logo.png',
                ),
                height: SizeConfig.screenHeight! * .30,
              ),
              SizedBox(height: SizeConfig.screenHeight! * .10),
              SizedBox(
                height: SizeConfig.screenHeight! * .11,
                width: SizeConfig.screenWidth! / 1.1,
                child: TextFormFieldItem(
                    // key: formkey,
                    labelText: 'Email',
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    errmess: "Please Fill email Input",
                    hintText: "Please enter your email "),
              ),

              SizedBox(
                height: SizeConfig.screenHeight! * .11,
                width: SizeConfig.screenWidth! / 1.1,
                child: TextFormFieldItem(
                    labelText: 'Passwoed',
                    controller: passward,
                    keyboardType: TextInputType.visiblePassword,
                    errmess: "Please Fill password Input",
                    hintText: "Please  enter your password "),
              ),
              button(
                  textButton: 'Log in',
                  onPressed: () async {
                    final snackBar = SnackBar(
                        content:
                            Text(TKeys.enterEmailAddress.translate(context)));
                    if (email.text == null && email.text.isEmpty) {
                      return;
                    } else {
                      try {
                        await signinWithEmailandPass(context,
                                email: email.text.trim(),
                                password: passward.text.trim())
                            .then((value) => Navigator.of(context)
                                .pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) => const HomePage()),
                                    (route) => false));
                      } catch (e) {
                        // ignore: deprecated_member_use
                        globalKey.currentState?.showSnackBar(snackBar);
                      }
                    }
                  }),
              // const SizedBox(height: 30),
              textAndButton(
                  text: 'Forget your passward ?',
                  onPressed: () {},
                  textButton: 'reset'),
              textAndButton(
                  text: 'Don\'t have an account ?',
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SignUp()));
                  },
                  textButton: 'Sign up with us'),
              const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  appBar({String? logo, String? bigTitle, double? size, double? left}) {
    return Stack(children: [
      SizedBox(
        height: SizeConfig.screenHeight! / 5,
        child: Column(children: [
          Container(
              width: double.infinity,
              child: Center(
                  child: Text(logo!,
                      style: const TextStyle(
                          fontSize: 38, fontWeight: FontWeight.bold))),
              height: SizeConfig.screenHeight! / 8,
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10,
                  ),
                  //BoxShadow()
                ],
              )),
          Container(
              margin: EdgeInsets.only(left: left!),
              width: size,
              child: Center(
                  child: Text(
                bigTitle!,
                style:
                    const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              )),
              height: SizeConfig.screenHeight! / 15,
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      blurRadius: 6,
                      spreadRadius: -2,
                      offset: Offset(0, 5)),
                  //BoxShadow()
                ],
              ))
        ]),
      ),
    ]);
  }

  button({required String textButton, required Function() onPressed}) {
    return SizedBox(
        height: SizeConfig.screenHeight! / 14,
        width: SizeConfig.screenWidth! * 0.6,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(textButton),
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(ColorsTheme.darkPrimaryColor)),
        ));
  }

  textAndButton(
      {required String? text,
      required Function()? onPressed,
      required String? textButton}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text!,
        ),
        TextButton(
            onPressed: onPressed,
            child: Text(textButton!,
                style: TextStyle(color: ColorsTheme.darkPrimaryColor)))
      ],
    );
  }
}
