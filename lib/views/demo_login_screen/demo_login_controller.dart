import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DemoLoginController extends GetxController {
  final txtUsernameController = TextEditingController();
  bool securedPassword = true;
  final txtPasswordController = TextEditingController();
  final txtRoleController = TextEditingController();

  @override
  void onReady() {
    super.onReady();
  }

  btnForgotPasswordClicked() {
    FocusManager.instance.primaryFocus?.unfocus();
    Get.back();
  }

  btnSignInClicked() {
    FocusManager.instance.primaryFocus?.unfocus();
    Get.back();
  }
}