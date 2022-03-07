import 'package:flutter/material.dart';

import '../core/utils/colors.dart';
class HomeContaintPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.share, size: 30,
                    color: ColorsTheme.darkPrimaryColor,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.notification_important, size: 30,
                    color: ColorsTheme.darkPrimaryColor,))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextField(
            decoration: InputDecoration(focusColor: ColorsTheme.darkPrimaryColor,
              prefix: IconButton(icon: Icon(Icons.mic),onPressed: (){},),
              suffix: IconButton(icon: Icon(Icons.search_rounded),onPressed: (){},),
              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorsTheme.darkPrimaryColor,),
                borderRadius: BorderRadius.all(
                  Radius.circular(15,),
                ),
              ),
              border: OutlineInputBorder(borderSide:BorderSide(color: ColorsTheme.darkPrimaryColor,) ,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
            ),
          ),
        ),
        Row(
          children: [
            places('Malls', () {}),
            places('Restaurants and Coffees', () {})
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        Row(
          children: [
            places('Entertainment and other Lorem', () {}),
            places('Hotels and Chalets', () {})
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ],
    );
  }
  Widget places(String places, var method) {
    return InkWell(
      onTap: method,
      child: Container(

        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: ColorsTheme.darkPrimaryColor,
        ),
        child: Text(
          places,
          style: TextStyle(
            color: ColorsTheme.whiteColor,
            fontSize: 17,
          ),
          textAlign: TextAlign.center,
        ),
        height: 70,
        width: 175,
        alignment: Alignment.center,
        margin: EdgeInsets.all(10),
      ),
    );
  }
}
