import 'package:flutter/material.dart';

class Password extends StatefulWidget {
  const Password({Key? key}) : super(key: key);

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  TextEditingController newPassward = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            appBar(
              logo: 'Let\'s Go',
            ),
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
              width: 300,
              child: Center(
                child: Text(
                  'Password has been modified successfully',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 60),
            const Icon(Icons.beenhere_outlined, size: 150, color: Colors.grey),
            const SizedBox(height: 180),
            button(textButton: 'Send', onPressed: () {})
          ],
        ),
      ),
    );
  }

  appBar({
    required String? logo,
  }) {
    return Stack(children: [
      SizedBox(
        height: 96,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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

  button({required String textButton, required Function() onPressed}) {
    return SizedBox(
        height: 50,
        width: 300,
        child: ElevatedButton(onPressed: onPressed, child: Text(textButton)));
  }
}
