import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:holping_needy_project/features/sigin%20sigup/widgets/textFormField.dart';
import 'package:holping_needy_project/pages/homepage.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String userEmail = "";

  final formkey = GlobalKey<FormState>();

  TextEditingController _emailcontroller = TextEditingController();

  TextEditingController _passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(userEmail),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailcontroller,
                    decoration: const InputDecoration(
                      hintText: 'Email',
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (email) => email != null &&
                            EmailValidator.validate(_emailcontroller.text)
                        ? 'Please Fill email Input'
                        : null),
                TextFormFieldItem(
                    controller: _emailcontroller,
                    errmess: "errmess",
                    labelText: "labelText",
                    hintText: "hintText",
                    keyboardType: TextInputType.emailAddress),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    controller: _passwordcontroller,
                    decoration: InputDecoration(
                      hintText: 'Password',
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (password) =>
                        password != null && password.length < 6
                            ? 'Please Fill password Input'
                            : null),
                SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      createnWithEmailandPass(
                          email: _emailcontroller.text.trim(),
                          password: _passwordcontroller.text.trim());
                    })
              ],
            )),
      ),
    );
  }

  // Future<UserCredential> signInWithGoogle() async {
  //   // Trigger the authentication flow
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  //   // Obtain the auth details from the request
  //   final GoogleSignInAuthentication googleAuth =
  //       await googleUser!.authentication;

  //   // Create a new credential
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth.accessToken,
  //     idToken: googleAuth.idToken,
  //   );

  //   userEmail = googleUser.email;

  //   print(googleUser.email);
  //   // Once signed in, return the UserCredential
  //   return await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //       email: credential.signInMethod, password: credential.providerId);
  // }

  Future signinWithEmailandPass({String? email, String? password}) async {
    final firebaseAuth = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
    try {
      return firebaseAuth;
    } on FirebaseAuthException catch (e) {}
  }

  Future createnWithEmailandPass({String? email, String? password}) async {
    final isValid = formkey.currentState!.validate();
    if (!isValid) return;
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HomePage()));

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
