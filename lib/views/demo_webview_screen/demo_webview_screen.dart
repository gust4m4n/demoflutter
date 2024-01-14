import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../widgets/navigationbar_x.dart';
import '../../widgets/screen_x.dart';
import 'demo_webview_controller.dart';

class DemoWebViewScreen extends StatelessWidget {
  backAction() {
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DemoWebViewController>(
        init: DemoWebViewController(),
        builder: (controller) => ScreenX(
              lightStatusBar: true,
              headerView: NavigationBarX(
                title: 'WebView',
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
