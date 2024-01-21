import 'package:qr_flutter/qr_flutter.dart';
import '../../widgets/all_widgets.dart';
import 'demo_qr_code_controller.dart';

class DemoQRCodeScreen extends StatelessWidget {
  DemoQRCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DemoQRCodeController>(
        init: DemoQRCodeController(),
        builder: (controller) => ScreenX(
              lightStatusBar: true,
              headerView: NavigationBarX(
                title: 'QR Code',
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
              bottomPadding: true,
              bodyView: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    QrImageView(
                      data: controller.code,
                      version: QrVersions.auto,
                      size: 250.0,
                    ),
                    const SizedBox(height: 4.0),
                    TextX(
                      controller.code,
                      color: ColorX.black,
                      fontSize: 17.0,
                      fontWeight: FontWeight.normal,
                      textAlign: TextAlign.start,
                      maxLines: 3,
                    ),
                  ],
                ),
              ),
            ));
  }
}
