import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/image_x.dart';
import '../../widgets/navigationbar_x.dart';
import '../../widgets/screen_x.dart';
import 'demo_image_controller.dart';

class DemoImageScreen extends StatelessWidget {
  final String url;
  DemoImageScreen({required this.url});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DemoImageController>(
      init: DemoImageController(),
      builder: (controller) => ScreenX(
          lightStatusBar: true,
          headerView: NavigationBarX(
            title: 'Image',
            leftIcon: 'lib/images/ic_demo_back.png',
            leftIconColor: Colors.white,
            leftAction: () {
              Get.back();
            },
          ),
          bottomPadding: false,
          bodyView: ImageX(
            url: url,
            width: 84.0,
            height: 84.0,
            cornerRadius: 12.0,
            fit: BoxFit.contain,
            padding: EdgeInsets.all(24.0),
          )),
    );
  }
}
