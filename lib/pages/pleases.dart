import 'package:flutter/material.dart';
import 'package:holping_needy_project/localization/t_key_v.dart';
import 'package:holping_needy_project/models/info/info.dart';
import 'package:holping_needy_project/pages/info_please.dart';

class Pleases extends StatelessWidget {
  Pleases(this.lisr, {Key? key}) : super(key: key);
  List lisr = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(TKeys().male),
        ),
        body: ListView.builder(
          itemCount: Market[0].length,
          itemBuilder: (context, itme) {
            return Card(
              elevation: 10,
              child: ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (__) => InofPlease(
                            itme,
                          )));
                },
                title: Text(Market[0][itme]),
              ),
            );
          },
        ));
  }
}
