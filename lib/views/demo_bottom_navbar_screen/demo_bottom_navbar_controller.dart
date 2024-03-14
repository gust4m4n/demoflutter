import '../../../utils/all_utils.dart';
import '../../viewmodels/demo_profile_vm.dart';
import '../../widgets/all_widgets.dart';

class DemoBottomNavBarController extends SuperController {
  int tabBarIndex = 0;
  DemoBottomNavBarController({this.tabBarIndex = 0});

  @override
  void onReady() {
    super.onReady();
    StatusBarX.setDark();
    DemoProfileVM.request().then((resp) {
      update();
    });
  }

  @override
  void onDetached() {
    LoggerX.log('[DemoBottomNavBarController] onDetached');
  }

  @override
  void onInactive() {
    LoggerX.log('[DemoBottomNavBarController] onInactive');
  }

  @override
  void onPaused() {
    LoggerX.log('[DemoBottomNavBarController] onPaused');
  }

  @override
  Future<void> onResumed() async {
    LoggerX.log('[DemoBottomNavBarController] onResumed');
    //await DemoAntiJailbreakVM.check();
  }

  @override
  void onClose() {
    super.onClose();
  }

  onChange(int index) {
    LoggerX.log('DemoBottomNavBarController.onChange: $index');
    tabBarIndex = index;

    switch (index) {
      case 0: // Home
        StatusBarX.setLight();
        //final HomeController controller = Get.find();
        //controller.reloadAll();
        update();
        break;
      case 1: // Profile
        StatusBarX.setLight();
        update();
        break;
    }
  }

  @override
  void onHidden() {}
}
