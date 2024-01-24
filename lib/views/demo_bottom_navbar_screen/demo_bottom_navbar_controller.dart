import 'package:get/get.dart';

class DemoBottomNavBarController extends GetxController {
  int selectedTab = 0;
  var content = '';

  @override
  void onInit() {
    super.onInit();
    onTabSelected(0);
  }

  @override
  void onReady() {
    super.onReady();
  }

  void onTabSelected(int index) {
    selectedTab = index;
    if (selectedTab == 0) {
      content = 'Home';
    } else if (selectedTab == 1) {
      content = 'Profile';
    }
    update();
  }
}
