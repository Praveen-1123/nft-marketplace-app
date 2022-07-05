import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetXSnackBar {
  void infoMessage(String message, String details) {
    Get.snackbar(
      message,
      details,
      isDismissible: true,
      shouldIconPulse: true,
      icon: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Icon(
          CupertinoIcons.app_badge,
          size: 35,
        ),
      ),
      backgroundColor: Colors.lightBlue,
      margin: EdgeInsets.only(top: 10, left: 20, right: 20),
      borderRadius: 15,
      barBlur: 40,
      padding: EdgeInsets.all(8),
    );
  }

  void successMessage(String message, String details) {
    Get.snackbar(
      message,
      details,
      isDismissible: true,
      shouldIconPulse: true,
      icon: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Icon(
          CupertinoIcons.checkmark_circle,
          size: 35,
        ),
      ),
      backgroundColor: Colors.lightGreen,
      margin: EdgeInsets.only(top: 10, left: 20, right: 20),
      borderRadius: 15,
      barBlur: 40,
      padding: EdgeInsets.all(8),
    );
  }

  void errorMessage(String message, String details) {
    Get.snackbar(
      message,
      details,
      isDismissible: true,
      shouldIconPulse: true,
      icon: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Icon(
          CupertinoIcons.xmark_circle,
          size: 35,
        ),
      ),
      backgroundColor: Colors.red,
      margin: EdgeInsets.only(top: 10, left: 20, right: 20),
      borderRadius: 15,
      barBlur: 40,
      padding: EdgeInsets.all(8),
    );
  }

  void warningMessage(String message, String details) {
    Get.snackbar(
      message,
      details,
      isDismissible: true,
      shouldIconPulse: true,
      icon: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Icon(
          CupertinoIcons.shield_slash,
          size: 35,
        ),
      ),
      backgroundColor: Colors.orange,
      margin: EdgeInsets.only(top: 10, left: 20, right: 20),
      borderRadius: 15,
      barBlur: 40,
      padding: EdgeInsets.all(8),
    );
  }
}
