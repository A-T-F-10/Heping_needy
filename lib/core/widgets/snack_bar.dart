import 'package:flutter/material.dart';
import 'package:holping_needy_project/localization/t_key_v.dart';

snackBar(BuildContext context) =>
    SnackBar(content: Text(TKeys.enterEmailAddress.translate(context)));
