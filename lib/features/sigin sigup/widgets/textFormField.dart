import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:holping_needy_project/core/utils/colors.dart';

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
    return Form(
      key: key,
      child: TextFormField(
          keyboardType: keyboardType,
          controller: controller,
          decoration: InputDecoration(
            labelText: labelText,
            hintText: hintText,
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
          ),
          validator: (email) => email != null && EmailValidator.validate(email)
              ? 'Please Fill $errmess Input'
              : null),
    );
  }
}
