import 'package:demoflutter/viewmodels/demo_profile_vm.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../widgets/all_widgets.dart';

class DemoProfileController extends GetxController {
  var version = '';

  @override
  void onReady() {
    super.onReady();
    PackageInfo.fromPlatform().then((info) {
      version = 'Version ${info.version}.${info.buildNumber}';
      update();
    });
    DemoProfileVM.request().then((resp) {
      update();
    });
  }
}
