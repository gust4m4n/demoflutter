import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StatusBarX {
  static var theme = SystemUiOverlayStyle.light;
  static setLight() {
    StatusBarX.theme = const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark);
    SystemChrome.setSystemUIOverlayStyle(theme);
  }

  static setDark() {
    StatusBarX.theme = const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light);
    SystemChrome.setSystemUIOverlayStyle(theme);
  }
}
