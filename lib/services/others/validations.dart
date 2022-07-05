import 'package:nft/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Validator {
  Future<bool> validateEmail(String email) async {
    return GetUtils.isEmail(email);
  }

  Future<bool> validateUsername(String uername) async {
    return GetUtils.isUsername(uername);
  }

  bool validateStructure(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  Future validatePassword(
    TextEditingController controller,
    BuildContext context,
  ) async {
    if (controller.text.length == 0) {
      GetXSnackBar().errorMessage("No password!", "Please enter a password");
    } else if (controller.text.length < 8) {
      GetXSnackBar().errorMessage(
          "Invalid password", "Password must be minimum 8 characters");
    } else if (!validateStructure(controller.text)) {
      GetXSnackBar()
          .warningMessage("Not secure", "Please enter a valid password");
    } else {
      Navigator.pop(context, true);
    }
  }
}
