import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFormFieldItem extends StatelessWidget {
  TextFormFieldItem(
      {Key? key,
      required this.controller,
      required this.errmess,
      required this.labelText,
      required this.hintText,
      required this.keyboardType})
      : super(key: key);
  TextEditingController controller = TextEditingController();
  String hintText;
  String labelText;
  String errmess;

  TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        keyboardType: keyboardType,
        controller: controller,
        decoration: InputDecoration(
            labelText: labelText, border: const OutlineInputBorder()),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (email) => email != null && EmailValidator.validate(email)
            ? 'Please Fill $errmess Input'
            : null);
  }
}
