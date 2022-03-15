import 'package:flutter/material.dart';
import 'package:holping_needy_project/core/utils/size_confg.dart';
import 'package:holping_needy_project/core/widgets/list_info_please.dart';
import 'package:holping_needy_project/localization/t_key_v.dart';
import 'package:holping_needy_project/models/info/Volunteers.dart';
import 'package:holping_needy_project/models/info/images_list.dart';
import 'package:holping_needy_project/pages/homepage.dart';

class InofPlease extends StatelessWidget {
  InofPlease(this.lisr, this.item, {Key? key}) : super(key: key);
  int item;
  List lisr = [];

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
        SizedBox(child: Image.asset(horelsImages[item])),
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
                  leading: Icon(Icons.location_on_outlined),
                  title: Text(lisr[1][item],
                      style:
                          TextStyle(fontSize: SizeConfig.defaultSize! * 1.8)),
                  trailing: IconButton(
                    icon: Icon(Icons.exit_to_app),
                    onPressed: () {},
                  )),
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
              ListTile(
                subtitle: Text(volunteersgender[0]),
                leading: const CircleAvatar(
                  child: Icon(Icons.person),
                ),
                title: Text(volunteers[0],
                    style: TextStyle(fontSize: SizeConfig.defaultSize! * 1.8)),
                trailing: Icon(Icons.call),
              ),
              ListTile(
                subtitle: Text(volunteersgender[1]),
                leading: const CircleAvatar(child: Icon(Icons.person)),
                title: Text(volunteers[1],
                    style: TextStyle(fontSize: SizeConfig.defaultSize! * 1.8)),
                trailing: Icon(Icons.call),
              ),
              ListTile(
                subtitle: Text(volunteersgender[2]),
                leading: const CircleAvatar(child: Icon(Icons.person)),
                title: Text(volunteers[2],
                    style: TextStyle(fontSize: SizeConfig.defaultSize! * 1.8)),
                trailing: Icon(Icons.call),
              ),
              ListTile(
                subtitle: Text(volunteersgender[3]),
                leading: const CircleAvatar(child: Icon(Icons.person)),
                title: Text(volunteers[3],
                    style: TextStyle(fontSize: SizeConfig.defaultSize! * 1.8)),
                trailing: Icon(Icons.call),
              ),
              ListTile(
                subtitle: Text(volunteersgender[4]),
                leading: const CircleAvatar(child: Icon(Icons.person)),
                title: Text(volunteers[4],
                    style: TextStyle(fontSize: SizeConfig.defaultSize! * 1.8)),
                trailing: Icon(Icons.call),
              ),
              ListTile(
                subtitle: Text(volunteersgender[4]),
                leading: const CircleAvatar(child: Icon(Icons.person)),
                title: Text(volunteers[5],
                    style: TextStyle(fontSize: SizeConfig.defaultSize! * 1.8)),
                trailing: Icon(Icons.call),
              ),
            ],
          ),
        ),
        SizedBox(
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
    required Function onTapUser,
  }) {
    return ListTile(
      onTap: onTapUser(),
      subtitle: Text(volunteersgenders),
      leading: const CircleAvatar(child: Icon(Icons.person)),
      title: Text(volunteersText,
          style: TextStyle(fontSize: SizeConfig.defaultSize! * 1.8)),
      trailing: Icon(Icons.call),
    );
  }
}
