import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:holping_needy_project/core/utils/colors.dart';
import 'package:holping_needy_project/localization/t_key_v.dart';

import 'about_containt_page.dart';
import 'connect_containt_page.dart';
import 'home_containt_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            TKeys.login.translate(context),
          ),
        ),
        bottomNavigationBar: menu(),
        body: TabBarView(
          children: [
            HomeContaintPage(),
            AboutContaintPage(),
            ConnectContaintPage(),
          ],
        ),
      ),
    );
  }

  Widget menu() {
    return Container(
      color: ColorsTheme.darkPrimaryColor,
      child: TabBar(
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white70,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: EdgeInsets.all(5.0),
        indicatorColor: Colors.blue,
        tabs: [
          Tab(
            text: "Home",
            icon: Icon(Icons.home),
          ),
          Tab(
            text: "Connect with us",
            icon: Icon(Icons.contact_support),
          ),
          Tab(
            text: "About me",
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
