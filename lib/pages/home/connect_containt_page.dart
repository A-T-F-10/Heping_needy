import 'package:flutter/material.dart';
import 'package:holping_needy_project/localization/t_key_v.dart';

class ConnectContaintPage extends StatelessWidget {
  const ConnectContaintPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text(
        TKeys().contecttext,
        style: TextStyle(fontSize: 30),
      )),
    );
  }
}
