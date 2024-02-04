import '../../utils/all_utils.dart';
import '../../viewmodels/demo_anti_jailbreak_vm.dart';
import '../../widgets/all_widgets.dart';

class DemoLoginController extends SuperController {
  final txtUsernameController = TextEditingController();
  bool securedPassword = true;
  final txtPasswordController = TextEditingController();
  final txtRoleController = TextEditingController();

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onDetached() {
    LoggerX.log('[DemoLoginController] onDetached');
  }

  @override
  void onInactive() {
    LoggerX.log('[DemoLoginController] onInactive');
  }

  @override
  void onPaused() {
    LoggerX.log('[DemoLoginController] onPaused');
  }

  @override
  Future<void> onResumed() async {
    LoggerX.log('[DemoLoginController] onResumed');
    await DemoAntiJailbreakVM.check();
  }

  btnForgotPasswordClicked() {
    FocusManager.instance.primaryFocus?.unfocus();
    Get.back();
  }

  btnSignInClicked() {
    FocusManager.instance.primaryFocus?.unfocus();
    Get.back();
  }
}
