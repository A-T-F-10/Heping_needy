import 'package:flutter/material.dart';
import 'package:holping_needy_project/core/utils/size_confg.dart';
import 'package:holping_needy_project/localization/t_key_v.dart';
import 'package:holping_needy_project/models/info/info.dart';
import 'package:holping_needy_project/pages/pleases/pleases.dart';
import '../../core/utils/colors.dart';

class HomeContaintPage extends StatelessWidget {
  const HomeContaintPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ListView(
      children: [
        Padding(
          padding:  EdgeInsets.all(SizeConfig.defaultSize! / 10,),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.share,
                    size: SizeConfig.defaultSize! * 3.5,
                    color: ColorsTheme.darkPrimaryColor,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notification_important,
                    size: SizeConfig.defaultSize! * 3.5,
                    color: ColorsTheme.darkPrimaryColor,
                  ))
            ],
          ),
        ),
        SizedBox(
          child: Image.asset(
            'assets/images/Logo.png',
          ),
          height: SizeConfig.screenHeight! * .28,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextField(
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  borderSide: BorderSide(
                    color: ColorsTheme.darkPrimaryColor,
                  )),
              prefix: IconButton(
                icon: const Icon(Icons.mic),
                onPressed: () {},
              ),
              suffix: IconButton(
                icon: const Icon(Icons.search_rounded),
                onPressed: () {},
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: ColorsTheme.darkPrimaryColor,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: SizeConfig.screenWidth! * 10,
          child: Row(
            children: [
              places(TKeys().malls, () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Pleases(
                          lisr: market,
                          tkey: TKeys().malls,
                        )));
              }),
              places(TKeys().restaurantsAndCoffees, () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Pleases(
                          lisr: resturant,
                          tkey: TKeys().restaurantsAndCoffees,
                        )));
              })
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
        Row(
          children: [
            places(TKeys().entertainmentAndOtherLorem, () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Pleases(
                        lisr: park,
                        tkey: TKeys().entertainmentAndOtherLorem,
                      )));
            }),
            places(TKeys().hotelsAndChalets, () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Pleases(
                        lisr: hotel,
                        tkey: TKeys().hotelsAndChalets,
                      )));
            })
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
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: ColorsTheme.darkPrimaryColor,
        ),
        child: Text(
          places,
          style: TextStyle(
            color: ColorsTheme.whiteColor,
            fontSize: SizeConfig.defaultSize! * 1.8,
          ),
          textAlign: TextAlign.center,
        ),
        height: SizeConfig.screenHeight! / 10,
        width: SizeConfig.screenWidth! / 2.5,
        alignment: Alignment.center,
        margin: const EdgeInsets.all(10),
      ),
    );
  }
}
