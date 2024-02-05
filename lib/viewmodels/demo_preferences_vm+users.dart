import 'dart:async';
import 'demo_preferences_vm.dart';

extension DemoUserPreferencesVM on DemoPreferencesVM {
  static Future<void> setToken(String value) async {
    await DemoPreferencesVM.setString(
        '81cd0129d09c01062bb0652902fe9188545070a9bb9478f01efcf65ba7e56f8a',
        value);
  }

  static Future<String> getToken() async {
    return await DemoPreferencesVM.getString(
        '81cd0129d09c01062bb0652902fe9188545070a9bb9478f01efcf65ba7e56f8a');
  }

  static Future<void> resetAll() async {
    await setToken('');
    await DemoPreferencesVM.deleteAll();
  }
}
