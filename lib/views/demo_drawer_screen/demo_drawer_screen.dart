import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/all_widgets.dart';
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
          leftBtn: ImageX(
            faIcon: FontAwesomeIcons.arrowLeft,
            width: 20.0,
            height: 20.0,
            color: Colors.white,
            fit: BoxFit.contain,
          ),
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
