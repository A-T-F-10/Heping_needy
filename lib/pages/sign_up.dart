import 'package:flutter/material.dart';
import 'package:holping_needy_project/core/utils/size_confg.dart';
import 'package:holping_needy_project/pages/login.dart';

import '../core/utils/colors.dart';
import '../features/sigin sigup/widgets/textFormField.dart';
import '../localization/t_key_v.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  LogInState logIn = LogInState();
  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController passward = TextEditingController();
  TextEditingController confirmPassward = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(appBar: AppBar(
          backgroundColor: ColorsTheme.darkPrimaryColor,
          title: Text(
            TKeys.signUp.translate(context),
            style: TextStyle(),
          ),
        ),

      body: ListView(children: [

        const SizedBox(height: 20),
        SizedBox(
          height: SizeConfig.screenHeight! * .11,
          width: SizeConfig.screenWidth! / 8,
          child: TextFormFieldItem(
              labelText: 'Passwoed',
              controller: passward,
              keyboardType: TextInputType.visiblePassword,
              errmess: "Please Fill password Input",
              hintText: "Please  enter your password "),
        ),

        const SizedBox(height: 45),
        TextFormFieldItem(
            labelText: 'Email',
            controller: passward,
            keyboardType: TextInputType.visiblePassword,
            errmess: "Please Fill Email ",
            hintText: "Please  enter your Email "),
        const SizedBox(height: 45),
        logIn.textField(
            labelText: 'Passward',
            controller: passward,
            onChanged: (v) {},
            dsabldText: true),
        const SizedBox(height: 45),
        logIn.textField(
            labelText: 'ConfirmPassward',
            controller: confirmPassward,
            onChanged: (v) {},
            dsabldText: true),
        const SizedBox(height: 45),
        logIn.button(textButton: 'Next', onPressed: () {})
      ]),
    ));
  }
}
