import 'package:package_info_plus/package_info_plus.dart';
import '../../viewmodels/demo_logout_vm.dart';
import '../../viewmodels/demo_profile_vm.dart';
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

  btnLogoutClicked() {
    Get.loading();
    DemoLogoutVM.request().then((resp) {
      Get.back();
      DemoProfileVM.logout();
    });
  }
}
