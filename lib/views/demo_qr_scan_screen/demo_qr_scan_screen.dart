import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../../widgets/container_x.dart';
import '../../widgets/navigationbar_x.dart';
import '../../widgets/screen_x.dart';
import '../../widgets/text_x.dart';
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
              leftIcon: 'lib/images/ic_demo_back.png',
              leftIconColor: Colors.white,
              leftAction: () {
                Get.back();
              },
            ),
            bottomPadding: true,
            bodyView: ContainerX(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ContainerX(
                      width: MediaQuery.of(context).size.width - 32.0,
                      height: MediaQuery.of(context).size.width - 32.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(32.0),
                        child: MobileScanner(
                          // fit: BoxFit.contain,
                          onDetect: (cap) {
                            final List<Barcode> barcodes = cap.barcodes;
                            final Uint8List? image = cap.image;
                            for (final barcode in barcodes) {
                              controller.capture = barcode;
                              controller.update();
                            }
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextX(
                      controller.capture != null
                          ? controller.capture!.rawValue!
                          : 'Scan something!',
                      color: const Color(0xff343a40),
                      fontSize: 17.0,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.center,
                      maxLines: 32,
                    ),
                  ],
                ))));
  }
}
