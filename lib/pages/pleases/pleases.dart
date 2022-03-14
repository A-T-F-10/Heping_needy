import 'package:flutter/material.dart';
import 'package:holping_needy_project/core/utils/size_confg.dart';
import 'package:holping_needy_project/pages/pleases/info_please.dart';

class Pleases extends StatelessWidget {
  Pleases({required this.tkey, required this.lisr, Key? key}) : super(key: key);
  List lisr = [];
  String tkey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(tkey),
        ),
        body: ListView.builder(
          itemCount: lisr[0].length,
          itemBuilder: (context, itme) {
            return Card(
              margin: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth! / 25,
                  vertical: SizeConfig.screenHeight! / 100),
              elevation: 10,
              child: ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (__) => InofPlease(
                            lisr,
                            itme,
                          )));
                },
                title: Text(lisr[0][itme]),
              ),
            );
          },
        ));
  }
}
