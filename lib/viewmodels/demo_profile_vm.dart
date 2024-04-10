import 'dart:async';
import 'dart:io';
import 'package:demoflutter/views/demo_onboarding_screen/demo_onboarding_screen.dart';

import '../models/demo_profile_model.dart';
import '../utils/all_utils.dart';
import '../widgets/all_widgets.dart';
import 'demo_apis.dart';
import 'demo_preferences_vm+users.dart';

class DemoProfileVM {
  static var profile = DemoProfileModel();

  static Future<DemoApiResponse> request() {
    return DemoApi.get(
            endpoint: '/profile',
            params: {},
            headers: {},
            contractFile: 'lib/contracts/DemoProfileContract.json',
            contract: true)
        .then((resp) async {
      if (resp.statusCode == 200) {
        final savedToken = profile.token;
        profile.decode(resp.jason['result']);
        profile.token = savedToken;
        await save();
      }
      return resp;
    });
  }

  static save() async {
    final jason = profile.encode();
    await DemoUserPreferencesVM.setProfile(jason.encoded(minify: true));
    LoggerX.log('[Profile] saved:\n${jason.encoded(minify: false)}');
  }

  static load() async {
    final jsonString = await DemoUserPreferencesVM.getProfile();
    final jason = Jason.decode(jsonString);
    profile.decode(jason);
    LoggerX.log('[Profile] loaded:\n${jason.encoded(minify: false)}');
  }

  static logout() {
    profile = DemoProfileModel();
    save();
    Get.deleteAll();
    Get.offAll(DemoOnboardingScreen());
    LoggerX.log('[Profile] logout');
  }

  static void forceQuit() {
    if (Platform.isAndroid) {
      SystemNavigator.pop();
    } else if (Platform.isIOS) {
      exit(0);
    }
  }
}
