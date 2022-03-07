import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:holping_needy_project/pages/login.dart';

final formkey = GlobalKey<FormState>();

Future signinWithEmailandPass({String? email, String? password}) async {
  final firebaseAuth = await FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: email!, password: password!);
  try {
    return firebaseAuth;
  } on FirebaseAuthException catch (e) {}
}

Future createnWithEmailandPass(BuildContext context,
    {String? email, String? password}) async {
  final isValid = formkey.currentState!.validate();
  if (!isValid) return;
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => const Center(
            child: CircularProgressIndicator(),
          ));
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => LogIn()));

  final firebaseAuth =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email!,
    password: password!,
  );

  try {
    return firebaseAuth;
  } on FirebaseAuthException catch (e) {
    Utils.showSnackBar(e.message);
  }
}

class Utils {
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();
  static showSnackBar(String? text) {
    if (text == null) return;

    final snackBar = SnackBar(
      content: Text(text),
      backgroundColor: Colors.red,
    );
    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
