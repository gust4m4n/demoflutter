import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../widgets/navigationbar_x.dart';
import '../../widgets/screen_x.dart';
import 'demo_html_controller.dart';

class DemoHtmlScreen extends StatelessWidget {
  backAction() {
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DemoHtmlController>(
        init: DemoHtmlController(),
        builder: (controller) => ScreenX(
              lightStatusBar: true,
              headerView: NavigationBarX(
                title: 'HTML',
                leftIcon: 'lib/images/ic_demo_back.png',
                leftIconColor: Colors.white,
                leftAction: () {
                  Get.back();
                },
              ),
              bottomPadding: false,
              bodyView: WebViewWidget(controller: controller.webController),
            ));
  }
}
