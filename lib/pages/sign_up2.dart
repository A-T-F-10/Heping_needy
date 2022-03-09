import 'package:flutter/material.dart';
import 'package:holping_needy_project/core/utils/colors.dart';
import 'package:holping_needy_project/core/utils/size_confg.dart';
import 'package:holping_needy_project/features/sigin%20sigup/widgets/textFormField.dart';
import 'package:holping_needy_project/localization/t_key_v.dart';
import 'package:holping_needy_project/pages/home_containt_page.dart';
import 'package:holping_needy_project/pages/login.dart';
import 'package:toggle_switch/toggle_switch.dart';

class SignUp2 extends StatefulWidget {
  const SignUp2({Key? key}) : super(key: key);

  @override
  State<SignUp2> createState() => SignUp2State();
}

class SignUp2State extends State<SignUp2> {
  LogInState logIn = LogInState();
  DateTime? dateTime = DateTime.now();
  TextEditingController type = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsTheme.darkPrimaryColor,
        title: Text(
          TKeys.signUp.translate(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: SizeConfig.screenHeight! / 10,
          ),
          text(text: TKeys.dateOfBirth.translate(context)),
          SizedBox(
            height: SizeConfig.screenHeight! / 40,
          ),
          date(
              day: dateTime!.day.toString(),
              month: dateTime!.month.toString(),
              years: dateTime!.year.toString(),
              onTap: showDate),
          sizedBox(),
          text(text: 'who has a disability'),
          sizedBox(),
          bigSwitch(
              text1: TKeys.you.translate(context),
              text2: TKeys.yourFamily.translate(context),
              onToggle: (i) {}),
          sizedBox(),
          SizedBox(
            width: SizeConfig.screenWidth! / 1.2,
            child: TextFormFieldItem(
                labelText: TKeys.type.translate(context),
                controller: type,
                keyboardType: TextInputType.visiblePassword,
                errmess: TKeys.isNotEmpty.translate(context),
                hintText: TKeys.type.translate(context)),
          ),
          sizedBox(),
          text(text: TKeys.gender.translate(context)),
          sizedBox(),
          bigSwitch(
              text1: TKeys.male.translate(context),
              text2: TKeys.female.translate(context),
              onToggle: (i) {}),
          sizedBox(),
          text(text: 'Location'),
          sizedBox(),
          location(
            controller: type,
            icon: const Icon(Icons.search),
          ),
          sizedBox(),
          logIn.button(
              textButton: TKeys.save.translate(context),
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: ((context) => HomeContaintPage())),
                    (route) => false);
              }),
          sizedBox(),
        ]),
      ),
    ));
  }

  text({required String text}) {
    return SizedBox(
      width: SizeConfig.screenWidth! / 1.5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  date(
      {required String day,
      required String month,
      required String years,
      Function()? onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: SizeConfig.screenWidth! * 0.41,
          height: SizeConfig.screenHeight! / 13,
          decoration: BoxDecoration(
            color: ColorsTheme.secondColor,
            boxShadow: [
              BoxShadow(
                color: ColorsTheme.secondColor,
                blurRadius: 10,
              ),
              //BoxShadow()
            ],
          ),
          child: InkWell(
            onTap: onTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                dateOfBirth(date: day),
                dateOfBirth(date: month),
                dateOfBirth(date: years),
              ],
            ),
          ),
        ),
        SizedBox(
          width: SizeConfig.screenWidth! / 5,
        ),
      ],
    );
  }

  showDate() {
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1960),
      lastDate: DateTime.now(),
    ).then((value) => setState(() {
          if (value != null) {
            dateTime = value;
          } else {
            dateTime = DateTime.now();
          }
        }));
  }

  bigSwitch(
      {required String text1,
      required String text2,
      required Function(int?)? onToggle}) {
    return ToggleSwitch(
      totalSwitches: 2,
      labels: [text1, text2],
      minHeight: SizeConfig.screenHeight! / 10.9,
      minWidth: SizeConfig.screenWidth! / 3,
      cornerRadius: 5,
      onToggle: onToggle,
    );
  }

  location({
    required TextEditingController controller,
    required Icon icon,
  }) {
    return SizedBox(
        width: SizeConfig.screenWidth! / 1.2,
        child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              suffixIcon: icon,
              labelStyle: TextStyle(color: ColorsTheme.darkPrimaryColor),
              focusColor: ColorsTheme.darkPrimaryColor,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: ColorsTheme.darkPrimaryColor,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: ColorsTheme.darkPrimaryColor,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
            )));
  }
}

Widget dateOfBirth({required String date}) {
  return Container(
    color: Colors.white,
    width: SizeConfig.screenWidth! / 7.5,
    height: SizeConfig.screenHeight! / 10,
    // ignore: prefer_const_constructors
    child: Center(child: Text(date)),
  );
}

Widget sizedBox() {
  return SizedBox(
    height: SizeConfig.screenHeight! / 40,
  );
}
