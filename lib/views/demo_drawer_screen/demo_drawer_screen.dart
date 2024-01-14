import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/navigationbar_x.dart';
import '../../widgets/screen_x.dart';
import '../../widgets/text_x.dart';
import 'demo_drawer.dart';
import 'demo_drawer_controller.dart';

class DemoDrawerScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey(); // Create a key
  DemoDrawerScreen({Key? key}) : super(key: key);

  backAction() {
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DemoDrawerController>(
      init: DemoDrawerController(),
      builder: (controller) => ScreenX(
        scaffoldKey: _scaffoldKey,
        drawer: DemoDrawer(),
        lightStatusBar: true,
        headerView: NavigationBarX(
          title: 'Drawer',
          leftIcon: 'lib/images/ic_demo_back.png',
          leftIconColor: Colors.white,
          leftAction: () {
            Get.back();
          },
        ),
        bottomPadding: false,
        bodyView: Center(
          child: const TextX(
            'Swipe to open drawer',
            color: Colors.black,
            fontSize: 22.0,
            fontWeight: FontWeight.w700,
            textAlign: TextAlign.start,
            maxLines: 1,
          ),
        ),
      ),
    );
  }
}
