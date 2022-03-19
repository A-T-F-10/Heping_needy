import 'package:flutter/material.dart';
import 'package:holping_needy_project/core/utils/size_confg.dart';
import 'package:holping_needy_project/localization/t_key_v.dart';
import 'package:holping_needy_project/models/info/Volunteers.dart';
import 'package:url_launcher/url_launcher.dart';

showdailg(BuildContext context, int item) async {
  return await showDialog(
    context: context,
    builder: (context) => Dialog(
      elevation: 10,
      child: SizedBox(
          height: SizeConfig.screenHeight! * .33,
          child: Column(
            children: [
              Text(TKeys().volunteer,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: SizeConfig.defaultSize! * 2.8,
                  )),
              const Divider(
                thickness: 2,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenHeight! / 50),
                child: Row(
                  children: [
                    Text(TKeys().name + " : ",
                        style:
                            TextStyle(fontSize: SizeConfig.defaultSize! * 3)),
                    Text(volunteers[item],
                        style: TextStyle(fontSize: SizeConfig.defaultSize! * 3))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenHeight! / 50),
                child: Row(
                  children: [
                    Text(TKeys().age + " : ",
                        style:
                            TextStyle(fontSize: SizeConfig.defaultSize! * 3)),
                    Text(volunteersAge[item],
                        style: TextStyle(fontSize: SizeConfig.defaultSize! * 3))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenHeight! / 50,
                    vertical: SizeConfig.screenHeight! / 90),
                child: Row(
                  children: [
                    Text(TKeys().gender + " : ",
                        style:
                            TextStyle(fontSize: SizeConfig.defaultSize! * 3)),
                    Text(volunteersgender[item],
                        style: TextStyle(fontSize: SizeConfig.defaultSize! * 3))
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton.icon(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green[500])),
                      label: Text("Whatsapp  "),
                      onPressed: () async {
                        await launch(
                            "whatsapp://send?phone=${volunteersNumber[item]}");
                      },
                      icon: const Icon(
                        Icons.whatsapp,
                        color: Colors.white,
                      )),
                  ElevatedButton.icon(
                      label: Text("Call  "),
                      onPressed: () async {
                        await launch("tel:${volunteersNumber[item]}");
                      },
                      icon: Icon(Icons.call)),
                ],
              )
            ],
          )),
    ),
  );
}
