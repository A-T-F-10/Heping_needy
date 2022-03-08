import 'package:flutter/material.dart';

class Volunteers extends StatefulWidget {
  const Volunteers({Key? key}) : super(key: key);

  @override
  State<Volunteers> createState() => _VolunteersState();
}

class _VolunteersState extends State<Volunteers> {
  TextEditingController username = TextEditingController();
  TextEditingController passward = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            appBar(
                logo: 'Let\'s Go',
                bigTitle: 'Volunteers',
                size: 150,
                left: 160),
            const SizedBox(height: 40),
            const SizedBox(
              child: Text(
                'Avaliable Vonteers',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 50),
            copy(text: 'Vonteers 1'),
            const SizedBox(height: 15),
            copy(text: 'Vonteers 2'),
            const SizedBox(height: 15),
            copy(text: 'Vonteers 3'),
            const SizedBox(height: 15),
            copy(text: 'Vonteers 4'),
            const SizedBox(height: 15),
            copy(text: 'Vonteers 5'),
            const SizedBox(height: 40),
            rowIcon(
                icon: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  color: Colors.grey,
                  iconSize: 40,
                  onPressed: () {},
                ),
                icon2: IconButton(
                  icon: const Icon(Icons.arrow_forward_outlined),
                  color: Colors.grey,
                  iconSize: 40,
                  onPressed: () {},
                ))
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

  container(
      {required String text,
      required Widget icon,
      required Widget icon2,
      required Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 300,
        height: 50,
        child: Row(children: [
          const SizedBox(width: 10),
          Text(text, style: const TextStyle(fontSize: 20)),
          const SizedBox(
            width: 100,
          ),
          icon,
          const SizedBox(
            width: 20,
          ),
          icon2
        ]),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 4,
            ),
            //BoxShadow()
          ],
        ),
      ),
    );
  }

  copy({required String text}) {
    return container(
        text: text,
        icon: const Icon(Icons.call_outlined, color: Colors.grey),
        icon2: const Icon(Icons.whatsapp, color: Colors.grey),
        onTap: () {});
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
}
