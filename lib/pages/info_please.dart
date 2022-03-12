import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holping_needy_project/pages/homepage.dart';

class InofPlease extends StatelessWidget {
  const InofPlease({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (__) => HomePage()),
                  (route) => false);
            },
          )
        ],
      ),
    );
  }
}
