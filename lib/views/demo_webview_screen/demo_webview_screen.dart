import 'package:webview_flutter/webview_flutter.dart';
import '../../widgets/all_widgets.dart';
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
              bodyView: WebViewWidget(controller: controller.webController),
            ));
  }
}
