import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          appBar(logo: 'Let\'s Go', bigTitle: 'Setting', size: 100, left: 200),
          rowIcon(
            icon: IconButton(
              icon: const Icon(Icons.share),
              color: Colors.grey,
              iconSize: 40,
              onPressed: () {},
            ),
          ),
          const SizedBox(height: 50),
          const Text('Language', style: TextStyle(fontSize: 22)),
          const SizedBox(height: 10),
          bigSwitch(text1: 'English', text2: 'عربي', onToggle: (i) {}),
          const SizedBox(height: 264),
          rowIcon(
            icon: IconButton(
              icon: const Icon(Icons.arrow_back),
              color: Colors.grey,
              iconSize: 40,
              onPressed: () {},
            ),
          ),
          Container(
            width: double.infinity,
            height: 1.5,
            color: Colors.grey,
          ),
          rowIcon(
            icon: IconButton(
              icon: const Icon(Icons.home),
              color: Colors.grey,
              iconSize: 40,
              onPressed: () {},
            ),
            icon2: IconButton(
                icon: const Icon(Icons.person),
                color: Colors.grey,
                iconSize: 40,
                onPressed: () {}),
          ),
        ],
      ),
    ));
  }

  appBar(
      {required String? logo,
      required String? bigTitle,
      required double? size,
      double? left}) {
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

  bigSwitch(
      {required String text1,
      required String text2,
      required Function(int?)? onToggle}) {
    return ToggleSwitch(
      totalSwitches: 2,
      labels: [text1, text2],
      minHeight: 50,
      minWidth: 150,
      cornerRadius: 5,
      activeBgColor: const [
        Colors.blue,
      ],
      onToggle: onToggle,
    );
  }
}
