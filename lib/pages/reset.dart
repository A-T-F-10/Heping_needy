import 'package:flutter/material.dart';

class Reset extends StatefulWidget {
  const Reset({Key? key}) : super(key: key);

  @override
  State<Reset> createState() => _ResetState();
}

class _ResetState extends State<Reset> {
  TextEditingController newPassward = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            appBar(logo: 'Let\'s Go', bigTitle: 'Reset', size: 90, left: 220),
            rowIcon(
                icon: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.grey,
              ),
              iconSize: 40,
            )),
            const SizedBox(height: 40),
            const SizedBox(
              child: Text(
                'Reset Password',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 60),
            textField(
                labelText: 'New PassWord',
                controller: newPassward,
                onChanged: (v) {}),
            const SizedBox(height: 240),
            button(textButton: 'Send', onPressed: () {})
          ],
        ),
      ),
    );
  }

  appBar({String? logo, String? bigTitle, double? size, double? left}) {
    return Stack(children: [
      SizedBox(
        height: 144,
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

  rowIcon({double? siz = 100, required Widget icon, Widget? icon2}) {
    return SizedBox(
      width: double.infinity,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        SizedBox(child: icon),
        SizedBox(
          width: siz,
        ),
        SizedBox(child: icon2)
      ]),
    );
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
}
