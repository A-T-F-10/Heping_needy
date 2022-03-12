import 'package:flutter/material.dart';
import 'package:holping_needy_project/core/utils/size_confg.dart';
import 'package:holping_needy_project/core/widgets/sigin_mathod.dart';
import 'package:holping_needy_project/core/widgets/snack_bar.dart';
import 'package:holping_needy_project/core/widgets/text_form_field.dart';
import 'package:holping_needy_project/pages/login.dart';
import 'package:holping_needy_project/pages/sign_up2.dart';

import '../core/utils/colors.dart';
import '../localization/t_key_v.dart';
import '../sharedpreferances/sharedpreferances_users.dart';
import '../models/models_sharedpreferances/model_sharedpreferances_signup1.dart';
import '../models/models_sharedpreferances/model_sharedpreferances_signup2.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  SharedpreferancesSignup2 users2 = SharedpreferancesSignup2();

  LogInState logIn = LogInState();
  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  SharedpreferancesSignup1 users = SharedpreferancesSignup1();
  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsTheme.darkPrimaryColor,
        title: Text(
          TKeys.signUp.translate(context),
          style: TextStyle(),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.screenWidth! / 20,
            vertical: SizeConfig.screenHeight! * .01),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            child: Image.asset(
              'assets/images/Logo.png',
            ),
            height: SizeConfig.screenHeight! * .30,
          ),
          SizedBox(height: SizeConfig.screenHeight! / 20),
          SizedBox(
            width: SizeConfig.screenWidth! / 1.1,
            child: TextFormFieldItem(
                labelText: TKeys.userName.translate(context),
                controller: username,
                keyboardType: TextInputType.name,
                errmess: TKeys.isNotEmpty.translate(context),
                hintText: TKeys.userNameHint.translate(context)),
          ),
          SizedBox(height: SizeConfig.screenHeight! / 20),
          SizedBox(
            width: SizeConfig.screenWidth! / 1.1,
            child: TextFormFieldItem(
                labelText: TKeys.email.translate(context),
                controller: email,
                keyboardType: TextInputType.emailAddress,
                errmess: "Please Fill email Input",
                hintText: TKeys.enterEmailAddress.translate(context)),
          ),
          SizedBox(height: SizeConfig.screenHeight! / 20),
          SizedBox(
            width: SizeConfig.screenWidth! / 1.1,
            child: TextFormFieldItem(
                labelText: TKeys.password.translate(context),
                controller: password,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                errmess: TKeys.invalidPassword.translate(context),
                hintText: TKeys.passwordHint.translate(context)),
          ),
          SizedBox(height: SizeConfig.screenHeight! / 20),
          SizedBox(
              width: SizeConfig.screenWidth! / 1.1,
              child: TextFormFieldItem(
                  labelText: TKeys.password.translate(context),
                  controller: confirmPassword,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  errmess: TKeys.invalidPassword.translate(context),
                  hintText: TKeys.passwordHint.translate(context))),
          SizedBox(height: SizeConfig.screenHeight! / 20),
          logIn.button(
              textButton: TKeys.next.translate(context),
              onPressed: () async {
                try {
                  if (email.text == null && email.text.isEmpty) {
                    return;
                  } else {
                    await createnWithEmailandPass(context,
                        email: email.text.trim(),
                        password: password.text.trim());
                  }
                  users2.email = email.text;
                  users2.userName = username.text;
                  SharedpreferancesSignup().saveData(users2: users2);
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => SignUp2()));
                } catch (e) {
                  // ignore: deprecated_member_use
                  globalKey.currentState?.showSnackBar(snackBar(context));
                }
              }),
          SizedBox(height: SizeConfig.screenHeight! / 20),
        ]),
      ),
    ));
  }
}
