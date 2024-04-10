import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class DemoQRScanController extends GetxController {
  Barcode? capture;

  @override
  void onReady() {
    super.onReady();
  }

  btnBackClicked() {
    Get.back();
  }
}
