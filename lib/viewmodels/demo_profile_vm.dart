import 'dart:async';
import '../models/demo_profile_model.dart';
import 'demo_apis.dart';

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
      profile = DemoProfileModel();
      if (resp.statusCode == 200) {
        profile.decode(resp.jason['result']);
      }
      return resp;
    });
  }
}
