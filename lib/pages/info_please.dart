import 'package:flutter/material.dart';
import 'package:holping_needy_project/core/utils/size_confg.dart';
import 'package:holping_needy_project/models/info/info.dart';
import 'package:holping_needy_project/pages/homepage.dart';

class InofPlease extends StatelessWidget {
  InofPlease(this.item, {Key? key}) : super(key: key);
  int item;
  List<String> lisr = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(Market[0][item]),
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (__) => const HomePage()),
                  (route) => false);
            },
          )
        ],
      ),
      body: ListView(children: [
        SizedBox(child: Image.asset("assets/images/imageplease.jpg")),
        ListTile(
          leading: Text(Market[1][item]),
          title: Text(Market[2][item]),
          trailing: Icon(Icons.accessible),
        )
      ]),
    );
  }
}
