import 'package:flutter/material.dart';
import 'package:holping_needy_project/core/utils/size_confg.dart';
import 'package:holping_needy_project/core/widgets/list_info_please.dart';
import 'package:holping_needy_project/localization/t_key_v.dart';
import 'package:holping_needy_project/models/info/Volunteers.dart';
import 'package:holping_needy_project/models/info/volunteer_show_dialog.dart';
import 'package:holping_needy_project/pages/homepage.dart';
import 'package:url_launcher/url_launcher.dart';

class InofPlease extends StatelessWidget {
  InofPlease(this.lisr, this.item, {required this.imageListb, Key? key})
      : super(key: key);
  int item;
  List lisr = [];
  List imageListb = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(lisr[0][item]),
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (__) => const HomePage()),
                  (route) => false);
            },
          )
        ],
      ),
      body: ListView(children: [
        SizedBox(child: Image.asset(imageListb[item])),
        Card(
          elevation: 10,
          child: Column(
            children: [
              ListTile(
                  title: Text(
                TKeys().information,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 19,
                ),
              )),
              const Divider(
                thickness: 2,
              ),
              ListTile(
                onTap: () async {
                  await launch(lisr[2][item]);
                },
                leading: Icon(Icons.location_on_outlined),
                title: Text(lisr[1][item],
                    style: TextStyle(fontSize: SizeConfig.defaultSize! * 1.8)),
                trailing: Icon(Icons.exit_to_app),
              ),
            ],
          ),
        ),
        information(),
        Card(
          elevation: 10,
          child: Column(
            children: [
              ListTile(
                title: Text(TKeys().volunteers,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: SizeConfig.defaultSize! * 2,
                    )),
              ),
              const Divider(
                thickness: 2,
              ),
              volunteersUser(
                context: context,
                volunteersText: volunteers[1],
                volunteersgenders: volunteersgender[1],
                volunteersNumber: 1,
              ),
              volunteersUser(
                  context: context,
                  volunteersText: volunteers[5],
                  volunteersgenders: volunteersgender[5],
                  volunteersNumber: 5),
              volunteersUser(
                  context: context,
                  volunteersText: volunteers[3],
                  volunteersgenders: volunteersgender[3],
                  volunteersNumber: 3),
              volunteersUser(
                  context: context,
                  volunteersText: volunteers[0],
                  volunteersgenders: volunteersgender[0],
                  volunteersNumber: 0),
              volunteersUser(
                  context: context,
                  volunteersText: volunteers[4],
                  volunteersgenders: volunteersgender[4],
                  volunteersNumber: 4),
              volunteersUser(
                  context: context,
                  volunteersText: volunteers[2],
                  volunteersgenders: volunteersgender[2],
                  volunteersNumber: 2),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ]),
    );
  }

  Widget information() {
    return Card(
      elevation: 10,
      child: Column(
        children: [
          listInfoPlease(
              icon: const Icon(Icons.child_care),
              title: TKeys().suitableforchildren,
              yesOrNo: TKeys().yes),
          listInfoPlease(
              icon: const Icon(Icons.hearing_disabled),
              title: TKeys().suitableforhearing,
              yesOrNo: TKeys().no),
          listInfoPlease(
              icon: const Icon(Icons.remove_red_eye),
              title: TKeys().suitableforthevisually,
              yesOrNo: TKeys().yes),
          listInfoPlease(
              icon: const Icon(Icons.nordic_walking_outlined),
              title: TKeys().suitableforthehandicapped,
              yesOrNo: TKeys().no),
          listInfoPlease(
              icon: const Icon(Icons.music_note),
              title: TKeys().music,
              yesOrNo: TKeys().yes),
          listInfoPlease(
              icon: const Icon(Icons.air_outlined),
              title: TKeys().outdoor,
              yesOrNo: TKeys().yes),
          listInfoPlease(
              icon: const Icon(Icons.elevator_outlined),
              title: TKeys().elevator,
              yesOrNo: TKeys().yes),
        ],
      ),
    );
  }

  Widget volunteersUser({
    required String volunteersText,
    required String volunteersgenders,
    required int volunteersNumber,
    required BuildContext context,
  }) {
    return ListTile(
      onTap: () {
        showdailg(context, volunteersNumber);
      },
      subtitle: Text(volunteersgenders),
      leading: const CircleAvatar(child: Icon(Icons.person)),
      title: Text(volunteersText,
          style: TextStyle(fontSize: SizeConfig.defaultSize! * 1.8)),
      trailing: const Icon(Icons.call),
    );
  }
}
