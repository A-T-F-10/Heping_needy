import 'package:flutter/material.dart';

class Home2 extends StatefulWidget {
  const Home2({Key? key}) : super(key: key);

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          appBar(logo: 'Let\'s Go'),
          const SizedBox(
            height: 20,
          ),
          rowIcon(
            icon: const Icon(Icons.share, color: Colors.grey, size: 40),
            onPressed: () {},
          ),
          const SizedBox(
            height: 40,
          ),
          container(text: 'hgf', text2: 'regse'),
          const SizedBox(
            height: 30,
          ),
          rowIcon(
              icon: const Icon(Icons.arrow_back, color: Colors.grey, size: 40),
              onPressed: () {},
              icon2: const Icon(Icons.arrow_forward_outlined,
                  color: Colors.grey, size: 40)),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            height: 1.5,
            color: Colors.grey,
          ),
          rowIcon(
              icon:
                  const Icon(Icons.home_outlined, color: Colors.grey, size: 40),
              onPressed: () {},
              icon2: const Icon(Icons.person_outline,
                  color: Colors.grey, size: 40)),
        ],
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

  rowIcon(
      {double? siz = 170,
      required Function()? onPressed,
      required Widget icon,
      Widget? icon2}) {
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

  container({required String? text, required String? text2}) {
    return SingleChildScrollView(
      child: SizedBox(
        height: 400,
        width: 300,
        child: Column(children: [
          Container(
            height: 150,
            width: 250,
            color: Colors.red,
            child: const Center(child: const Text('gfhjfd')),
          ),
          Text(text!),
          const SizedBox(height: 15),
          Container(
            height: 150,
            width: 250,
            color: Colors.red,
            child: const Center(child: Text('gfhjfd')),
          ),
          Text(text2!),
        ]),
      ),
    );
  }
}
