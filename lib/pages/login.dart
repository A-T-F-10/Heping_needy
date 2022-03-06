import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => LogInState();
}

class LogInState extends State<LogIn> {
  TextEditingController username = TextEditingController();
  TextEditingController passward = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            appBar(logo: 'Let\'s Go', bigTitle: 'Login', size: 90, left: 220),
            const SizedBox(height: 10),
            textField(
                labelText: 'Username', controller: username, onChanged: (v) {}),
            const SizedBox(height: 50),
            textField(
                labelText: 'Passward', controller: passward, onChanged: (v) {}),
            const SizedBox(height: 50),
            button(textButton: 'Log in', onPressed: () {}),
            const SizedBox(height: 30),
            textAndButton(
                text: 'Forget your passward ?',
                onPressed: () {},
                textButton: 'reset'),
            textAndButton(
                text: 'Don\'t have an account ?',
                onPressed: () {},
                textButton: 'Sign up with us'),
            const SizedBox(),
          ],
        ),
      ),
    );
  }

  appBar({String? logo, String? bigTitle, double? size, double? left}) {
    return Stack(children: [
      SizedBox(
        height: 180,
        child: Column(children: [
          Container(
              width: double.infinity,
              child: Center(
                  child: Text(logo!,
                      style: const TextStyle(
                          fontSize: 38, fontWeight: FontWeight.bold))),
              height: 96,
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
              height: 48,
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
