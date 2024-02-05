import 'package:mobile_scanner/mobile_scanner.dart';
import '../../widgets/all_widgets.dart';
import 'demo_qr_scan_controller.dart';

class DemoQRScanScreen extends StatelessWidget {
  DemoQRScanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DemoQRScanController>(
        init: DemoQRScanController(),
        builder: (controller) => ScreenX(
            lightStatusBar: true,
            headerView: NavigationBarX(
              title: 'QR Scan',
              leftBtn: ImageX(
                faIcon: FontAwesomeIcons.arrowLeft,
                width: 20.0,
                height: 20.0,
                color: ColorX.white,
                fit: BoxFit.contain,
              ),
              leftAction: () {
                controller.btnBackClicked();
              },
            ),
            bottomPadding: true,
            bodyView: ContainerX(
                child: Column(
              children: [
                Expanded(
                  child: ContainerX(
                    child: MobileScanner(
                      onDetect: (cap) {
                        final List<Barcode> barcodes = cap.barcodes;
                        for (final barcode in barcodes) {
                          controller.capture = barcode;
                          controller.update();
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                ContainerX(
                  height: 100.0,
                  child: TextX(
                    controller.capture != null
                        ? controller.capture!.rawValue!
                        : 'Scan something!',
                    color: ColorX.black,
                    fontSize: 17.0,
                    fontWeight: FontWeight.w600,
                    textAlign: TextAlign.center,
                    maxLines: 3,
                  ),
                ),
              ],
            ))));
  }
}
