import 'package:webview_flutter/webview_flutter.dart';
import '../../widgets/all_widgets.dart';
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
