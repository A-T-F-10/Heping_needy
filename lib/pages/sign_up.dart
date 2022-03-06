import 'package:flutter/material.dart';
import 'package:holping_needy_project/pages/login.dart';

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
        child: Scaffold(
      body: Column(children: [
        logIn.appBar(
            logo: 'Let\'s Go', bigTitle: 'Sign Up', size: 130, left: 180),
        const SizedBox(height: 20),
        logIn.textField(
          labelText: 'E-mail',
          controller: email,
          onChanged: (v) {},
        ),
        const SizedBox(height: 45),
        logIn.textField(
            labelText: 'Username', controller: username, onChanged: (v) {}),
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
