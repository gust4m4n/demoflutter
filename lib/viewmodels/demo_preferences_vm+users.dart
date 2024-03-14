import 'dart:async';
import 'demo_preferences_vm.dart';

extension DemoUserPreferencesVM on DemoPreferencesVM {
  static Future<void> setProfile(String value) async {
    await DemoPreferencesVM.setString(
        'ffaa1ca7884538c1f480d413a183db1c2df42f8cc5e6b48e791e07549d556796',
        value);
  }

  static Future<String> getProfile() async {
    return await DemoPreferencesVM.getString(
        'ffaa1ca7884538c1f480d413a183db1c2df42f8cc5e6b48e791e07549d556796');
  }

  static Future<void> resetAll() async {
    await setProfile('');
    await DemoPreferencesVM.deleteAll();
  }
}
