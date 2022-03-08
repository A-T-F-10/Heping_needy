import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          appBar(logo: 'Let\'s Go'),
          const SizedBox(height: 10),
          rowIcon(
            icon: IconButton(
              icon: const Icon(Icons.share),
              color: Colors.grey,
              iconSize: 40,
              onPressed: () {},
            ),
            icon2: IconButton(
                icon: const Icon(Icons.notification_important),
                color: Colors.grey,
                iconSize: 40,
                onPressed: () {}),
          ),
          const SizedBox(height: 50),
          search(),
          const SizedBox(height: 100),
          container(
              text: 'text', text2: 'text2', text3: 'text3', text4: 'text4'),
          const SizedBox(height: 90),
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

  container(
      {required String? text,
      required String? text2,
      required String? text3,
      required String? text4}) {
    return SizedBox(
      width: 300,
      height: 200,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Positioned(
                child: containerSize(height: 70, width: 145, text: text!)),
            Positioned(
                child: containerSize(height: 120, width: 145, text: text2!)),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Positioned(
                child: containerSize(height: 120, width: 145, text: text4!)),
            Positioned(
                child: containerSize(height: 70, width: 145, text: text3!)),
          ],
        )
      ]),
    );
  }

  containerSize(
      {required double height, required double width, required String text}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 4,
          ),
          //BoxShadow()
        ],
        borderRadius: BorderRadius.circular(5),
      ),
      height: height,
      width: width,
      child: Center(child: Text(text)),
    );
  }

  search() {
    return Container(
      width: 300,
      height: 50,
      decoration: const BoxDecoration(
        color: Colors.grey,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 0.5,
          ),
          //BoxShadow()
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            color: Colors.white,
            width: 260,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.mic_none,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          Container(
              color: Colors.grey,
              width: 40,
              // ignore: prefer_const_constructors
              child: Center(
                  child: const Icon(
                Icons.search,
              ))),
        ],
      ),
    );
  }
}
