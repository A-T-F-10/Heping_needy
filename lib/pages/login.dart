import 'package:flutter/material.dart';
import 'package:holping_needy_project/core/utils/size_confg.dart';
import 'package:holping_needy_project/core/widgets/sigin_mathod.dart';
import 'package:holping_needy_project/features/sigin%20sigup/widgets/textFormField.dart';
import 'package:holping_needy_project/localization/t_key_v.dart';
import 'package:holping_needy_project/pages/sign_up.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => LogInState();
}

class LogInState extends State<LogIn> {
  TextEditingController email = TextEditingController();
  TextEditingController passward = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              appBar(
                  logo: 'Let\'s Go',
                  bigTitle: 'Login',
                  size: SizeConfig.defaultSize! * 15,
                  left: SizeConfig.defaultSize! * 20),
              SizedBox(height: SizeConfig.screenHeight! * .15),
              SizedBox(
                height: SizeConfig.screenHeight! * .10,
                width: SizeConfig.screenWidth! / 1.1,
                child: TextFormFieldItem(
                    labelText: '',
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    errmess: "Please Fill email Input",
                    hintText: "Please enter your email "),
              ),

              SizedBox(
                height: SizeConfig.screenHeight! * .10,
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
                    await signinWithEmailandPass(
                        email: email.text, password: passward.text);
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

  textField({
    required String? labelText,
    required TextEditingController? controller,
    required Function(String)? onChanged,
    bool dsabldText = false,
  }) {
    return SizedBox(
      width: 300,
      child: TextField(
        obscureText: dsabldText,
        decoration: InputDecoration(
            labelText: labelText, border: const OutlineInputBorder()),
        controller: controller,
        onChanged: onChanged,
      ),
    );
  }

  button({required String textButton, required Function() onPressed}) {
    return SizedBox(
        height: 50,
        width: 300,
        child: ElevatedButton(onPressed: onPressed, child: Text(textButton)));
  }

  textAndButton(
      {required String? text,
      required Function()? onPressed,
      required String? textButton}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text!),
        TextButton(onPressed: onPressed, child: Text(textButton!))
      ],
    );
  }
}
