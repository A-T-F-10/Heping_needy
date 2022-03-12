import 'package:flutter/material.dart';
import 'package:holping_needy_project/localization/t_key_v.dart';
import 'package:holping_needy_project/models/info/info.dart';
import 'package:holping_needy_project/pages/info_please.dart';

class Pleases extends StatelessWidget {
  const Pleases({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(TKeys().male),
        ),
        body: ListView.builder(
          itemCount: nameIfon.length,
          itemBuilder: (context, itme) {
            return Card(
              elevation: 10,
              child: ListTile(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (__) => InofPlease()));
                },
                title: Text(nameIfon[itme]),
              ),
            );
          },
        ));
  }
}
