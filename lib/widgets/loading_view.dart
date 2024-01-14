import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingView {
  static var indicatorColor = const Color(0XFF1BC1CE);
  static var isShowing = false;
  static show() {
    if (isShowing == false) {
      isShowing = true;
      showDialog(
          barrierDismissible: false,
          context: Get.context!,
          builder: (BuildContext context) {
            return dialog();
          });
    }
  }

  static dismiss() {
    if (isShowing == true) {
      isShowing = false;
      Navigator.of(Get.context!).pop();
    }
  }

  static dialog() {
    return const Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      child: Center(
        child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color(0XFF1BC1CE))),
      ),
    );
  }
}
