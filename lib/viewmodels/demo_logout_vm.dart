import 'dart:async';
import 'package:demoflutter/viewmodels/demo_apis.dart';

class DemoLogoutVM {
  static Future<DemoApiResponse> request() {
    return DemoApi.post(
            endpoint: '/logout',
            params: {},
            headers: {},
            contractFile: 'lib/contracts/DemoLogoutContract.json',
            contract: true)
        .then((resp) async {
      return resp;
    });
  }
}
