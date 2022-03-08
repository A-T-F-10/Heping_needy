import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            appBar(logo: 'Let\'s Go'),
            const SizedBox(height: 10),
            rowIcon(),
            const SizedBox(height: 50),
            const SizedBox(
              child: Text(
                'Connect With Us',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 50),
            button(
                icon: const Icon(Icons.settings, color: Colors.grey),
                text: 'Settings',
                onTap: () {}),
            const SizedBox(height: 30),
            button(
                icon: const Icon(Icons.connect_without_contact,
                    color: Colors.grey),
                text: 'Connect With Us',
                onTap: () {}),
            const SizedBox(height: 30),
            button(
                icon: const Icon(Icons.logout, color: Colors.grey),
                text: 'Log Out',
                onTap: () {}),
            const SizedBox(height: 30),
          ],
        ),
      ),
    ));
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

  rowIcon({double? siz = 170, Function()? onPressed}) {
    return SizedBox(
      width: double.infinity,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        IconButton(
            icon: const Icon(Icons.arrow_back),
            iconSize: 35,
            onPressed: onPressed),
        SizedBox(
          width: siz,
        ),
      ]),
    );
  }

  button(
      {required Widget icon,
      required String? text,
      required Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 8,
            ),
            //BoxShadow()
          ],
        ),
        height: 50,
        width: 300,
        child: Row(children: [
          const SizedBox(width: 20),
          icon,
          const SizedBox(width: 30),
          Text(text!,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold))
        ]),
      ),
    );
  }
}
