import 'package:flutter/material.dart';
import 'package:holping_needy_project/core/utils/colors.dart';
import 'package:holping_needy_project/localization/t_key_v.dart';
import 'home/about_containt_page.dart';
import 'home/connect_containt_page.dart';
import 'home/home_containt_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            TKeys().home,
          ),
        ),
        bottomNavigationBar: menu(),
        body: TabBarView(
          children: [
            HomeContaintPage(),
            ConnectContaintPage(),
            AboutContaintPage(),
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
