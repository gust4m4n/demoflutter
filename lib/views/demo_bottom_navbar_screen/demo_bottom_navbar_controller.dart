import '../../../utils/all_utils.dart';
import '../../widgets/all_widgets.dart';

class DemoBottomNavBarController extends SuperController {
  int tabBarIndex = 0;
  DemoBottomNavBarController({this.tabBarIndex = 0});

  @override
  Future<void> onReady() async {
    super.onReady();
    StatusBarX.setDark();
  }

  @override
  void onClose() {
    super.onClose();
  }

  onChange(int index) {
    LoggerX.log('DemoBottomNavBarController.onChange: $index');
    tabBarIndex = index;
    update();

    switch (index) {
      case 0:
        StatusBarX.setLight();
        //final HomeController controller = Get.find();
        //controller.reloadAll();
        break;
      case 1:
        StatusBarX.setLight();
        break;
      case 2:
        StatusBarX.setLight();
        break;
    }
  }

  @override
  void onDetached() {
    LoggerX.log('[TabBar] onDetached');
  }

  @override
  void onInactive() {
    LoggerX.log('[TabBar] onInactive');
  }

  @override
  void onPaused() {
    LoggerX.log('[TabBar] onPaused');
  }

  @override
  void onResumed() {
    LoggerX.log('[TabBar] onResumed');
  }
}