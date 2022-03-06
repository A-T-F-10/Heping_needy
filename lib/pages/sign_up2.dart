import 'package:flutter/material.dart';
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
  String you = 'You';
  String yourFamily = 'Your Family';
  TextEditingController type = TextEditingController();
  String male = 'Male';
  String female = 'Female';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(children: [
        logIn.appBar(
            logo: 'Let\'s Go', bigTitle: 'Sign Up', size: 130, left: 180),
        text(text: 'Date Of Birth'),
        const SizedBox(
          height: 5,
        ),
        date(
            day: dateTime!.day.toString(),
            month: dateTime!.month.toString(),
            years: dateTime!.year.toString(),
            onTap: showDate),
        const SizedBox(
          height: 20,
        ),
        text(text: 'Who has a d'),
        const SizedBox(
          height: 5,
        ),
        bigSwitch(text1: 'You', text2: 'Your Family', onToggle: (i) {}),
        const SizedBox(
          height: 20,
        ),
        logIn.textField(
            labelText: 'Type of', controller: type, onChanged: (v) {}),
        const SizedBox(
          height: 20,
        ),
        text(text: 'Gender'),
        const SizedBox(
          height: 5,
        ),
        bigSwitch(text1: male, text2: female, onToggle: (i) {}),
        const SizedBox(
          height: 20,
        ),
        text(text: 'Location'),
        const SizedBox(
          height: 5,
        ),
        location(),
        const SizedBox(
          height: 20,
        ),
        logIn.button(textButton: 'Save', onPressed: () {})
      ]),
    ));
  }

  text({required String text}) {
    return SizedBox(
      width: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
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
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 30,
          ),
          Container(
            width: 150,
            height: 50,
            decoration: const BoxDecoration(
              color: Colors.grey,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 0.5,
                ),
                //BoxShadow()
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: Colors.white,
                  width: 44,
                  height: 50,
                  // ignore: prefer_const_constructors
                  child: Center(child: Text(day)),
                ),
                Container(
                  color: Colors.white,
                  width: 44,
                  height: 50,
                  // ignore: prefer_const_constructors
                  child: Center(child: Text(month)),
                ),
                Container(
                  color: Colors.white,
                  width: 61,
                  height: 50,
                  // ignore: prefer_const_constructors
                  child: Center(child: Text(years)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  showDate() {
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1960),
      lastDate: DateTime.now(),
    ).then((value) => setState(() {
          dateTime = value;
        }));
  }

  bigSwitch(
      {required String text1,
      required String text2,
      required Function(int?)? onToggle}) {
    return ToggleSwitch(
      totalSwitches: 2,
      labels: [text1, text2],
      minHeight: 50,
      minWidth: 150,
      cornerRadius: 5,
      activeBgColor: const [
        Colors.blue,
      ],
      onToggle: onToggle,
    );
  }

  location() {
    return Container(
      width: 300,
      height: 50,
      decoration: const BoxDecoration(
        color: Colors.grey,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 0.5,
          ),
          //BoxShadow()
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            color: Colors.white,
            width: 240,
            height: 50,
          ),
          Container(
              color: Colors.grey,
              width: 60,
              height: 50,
              // ignore: prefer_const_constructors
              child: Center(child: Icon(Icons.search))),
        ],
      ),
    );
  }
}
