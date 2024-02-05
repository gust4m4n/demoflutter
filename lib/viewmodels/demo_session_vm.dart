import 'dart:io';
import 'package:flutter/services.dart';
import 'demo_preferences_vm+users.dart';
import 'demo_preferences_vm.dart';

class DemoSessionVM {
  static String token = '';

  static load() async {
    token = await DemoUserPreferencesVM.getToken();
  }

  static logout() async {
    token = '';
    await DemoPreferencesVM.deleteAll();
  }

  static void forceQuit() {
    if (Platform.isAndroid) {
      SystemNavigator.pop();
    } else if (Platform.isIOS) {
      exit(0);
    }
  }
}
