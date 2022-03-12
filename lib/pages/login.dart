import 'package:flutter/material.dart';
import 'package:holping_needy_project/core/utils/size_confg.dart';
import 'package:holping_needy_project/core/widgets/sigin_mathod.dart';
import 'package:holping_needy_project/core/widgets/snack_bar.dart';
import 'package:holping_needy_project/core/widgets/text_form_field.dart';
import 'package:holping_needy_project/localization/t_key_v.dart';
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
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    errmess: "Please Fill password Input",
                    hintText: "Please  enter your password "),
              ),
              button(
                  textButton: 'Log in',
                  onPressed: () async {
                    if (email.text == null && email.text.isEmpty) {
                      // ignore: deprecated_member_use
                      globalKey.currentState?.showSnackBar(snackBar(
                          text: TKeys.enterEmailAddress.translate(context)));

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
                        globalKey.currentState?.showSnackBar(
                            snackBar(text: TKeys.account.translate(context)));
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
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        text!,
      ),
      TextButton(
          onPressed: onPressed,
          child: Text(textButton!,
              style: TextStyle(color: ColorsTheme.darkPrimaryColor)))
    ]);
  }
}
