import 'demo_preferences_vm.dart';

class DemoSessionVM {
  static String token = '';

  static load() async {
    token = await DemoPreferencesVM.getToken();
  }

  static logout() async {
    token = '';
    await DemoPreferencesVM.deleteAll();
  }
}
