import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/all_utils.dart';
import '../../viewmodels/demo_security_vm.dart';
import '../../widgets/all_widgets.dart';
import '../../widgets/dialog_x.dart';
import '../demo_bottom_navbar_screen/demo_bottom_navbar_screen.dart';
import '../demo_drawer_screen/demo_drawer_screen.dart';
import '../demo_gridview_screen/demo_gridview_screen.dart';
import '../demo_html_screen/demo_html_screen.dart';
import '../demo_image_screen/demo_image_screen.dart';
import '../demo_listview_screen/demo_listview_screen.dart';
import '../demo_login_screen/demo_login_screen.dart';
import '../demo_onboarding_screen/demo_onboarding_screen.dart';
import '../demo_qr_code_screen/demo_qr_code_screen.dart';
import '../demo_qr_scan_screen/demo_qr_scan_screen.dart';
import '../demo_tabbar_screen/demo_tabbar_screen.dart';
import '../demo_webview_screen/demo_webview_screen.dart';
import 'demo_controller.dart';

class DemoScreen extends StatelessWidget {
  DemoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DemoController>(
        init: DemoController(),
        builder: (controller) => ScreenX(
            headerView: NavigationBarX(
              title: 'DemoFlutter',
            ),
            lightStatusBar: true,
            bottomPadding: true,
            bodyView: Column(
              children: <Widget>[
                Expanded(
                  child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: <Widget>[
                          const ContainerX(
                            backgroundColor: ColorX.gray,
                            width: double.infinity,
                            padding: EdgeInsets.all(4.0),
                            cornerRadius: 8.0,
                            child: TextX('Login and Accounts',
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                textAlign: TextAlign.center,
                                maxLines: 1),
                          ),
                          const SizedBox(height: 4.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: ButtonX(
                                  title: 'Onboarding',
                                  backgroundColor: ColorX.teal,
                                  onClicked: () {
                                    Get.to(DemoOnboardingScreen());
                                  },
                                ),
                              ),
                              const SizedBox(width: 8.0),
                              Expanded(
                                child: ButtonX(
                                  title: 'Login',
                                  backgroundColor: ColorX.teal,
                                  onClicked: () {
                                    Get.to(DemoLoginScreen(), popGesture: true);
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          const ContainerX(
                            backgroundColor: ColorX.gray,
                            width: double.infinity,
                            padding: EdgeInsets.all(4.0),
                            cornerRadius: 8.0,
                            child: TextX('Alert and Toasts',
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                textAlign: TextAlign.center,
                                maxLines: 1),
                          ),
                          const SizedBox(height: 4.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: ButtonX(
                                  title: 'Toast',
                                  backgroundColor: ColorX.green,
                                  onClicked: () {
                                    controller.btnToastClicked();
                                  },
                                ),
                              ),
                              const SizedBox(width: 8.0),
                              Expanded(
                                child: ButtonX(
                                  title: 'SnackBar',
                                  backgroundColor: ColorX.green,
                                  onClicked: () {
                                    controller.btnSnackBarClicked();
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: ButtonX(
                                  title: 'Internet Offline',
                                  backgroundColor: ColorX.green,
                                  onClicked: () {
                                    controller.btnInternetOfflineClicked();
                                  },
                                ),
                              ),
                              const SizedBox(width: 8.0),
                              Expanded(
                                child: ButtonX(
                                  title: 'Internet Online',
                                  backgroundColor: ColorX.green,
                                  onClicked: () {
                                    controller.btnInternetOnlineClicked();
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                  child: ButtonX(
                                title: 'Dialog',
                                backgroundColor: ColorX.green,
                                onClicked: () {
                                  DialogX.showMessage(
                                      title: LoremIpsumX.tiny(),
                                      message: LoremIpsumX.medium(),
                                      imageUrl: 'lib/images/ic_demo_logo.png',
                                      leftBtnTitle: 'OK',
                                      onLeftBtnClicked: () {
                                        Get.back();
                                      },
                                      rightBtnTitle: 'Cancel',
                                      onRightBtnClicked: () {
                                        Get.back();
                                      });
                                },
                              )),
                              const SizedBox(width: 8.0),
                              Expanded(
                                  child: ButtonX(
                                title: 'Bottom Sheet',
                                backgroundColor: ColorX.green,
                                onClicked: () {
                                  controller.btnBottomSheetClicked();
                                },
                              )),
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                  child: ButtonX(
                                title: 'Loading',
                                backgroundColor: ColorX.green,
                                onClicked: () {
                                  controller.btnLoadingClicked();
                                },
                              )),
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          const ContainerX(
                            backgroundColor: ColorX.gray,
                            width: double.infinity,
                            padding: EdgeInsets.all(4.0),
                            cornerRadius: 8.0,
                            child: TextX('Grid and ListView',
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                textAlign: TextAlign.center,
                                maxLines: 1),
                          ),
                          const SizedBox(height: 4.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: ButtonX(
                                  title: 'ListView',
                                  backgroundColor: ColorX.yellow,
                                  onClicked: () {
                                    Get.to(DemoListViewScreen(),
                                        popGesture: true);
                                  },
                                ),
                              ),
                              const SizedBox(width: 8.0),
                              Expanded(
                                child: ButtonX(
                                  title: 'GridView',
                                  backgroundColor: ColorX.yellow,
                                  onClicked: () {
                                    Get.to(DemoGridViewScreen(),
                                        popGesture: true);
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: ButtonX(
                                  title: 'Drawer',
                                  backgroundColor: ColorX.yellow,
                                  onClicked: () {
                                    Get.to(DemoDrawerScreen());
                                  },
                                ),
                              ),
                              const SizedBox(width: 8.0),
                              Expanded(
                                  child: ButtonX(
                                title: 'Image',
                                backgroundColor: ColorX.yellow,
                                onClicked: () {
                                  Get.to(DemoImageScreen(
                                    url:
                                        'https://storage.googleapis.com/cms-storage-bucket/c823e53b3a1a7b0d36a9.png',
                                  ));
                                },
                              )),
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          const ContainerX(
                            backgroundColor: ColorX.gray,
                            width: double.infinity,
                            padding: EdgeInsets.all(4.0),
                            cornerRadius: 8.0,
                            child: TextX('WebViews',
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                textAlign: TextAlign.center,
                                maxLines: 1),
                          ),
                          const SizedBox(height: 4.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                  child: ButtonX(
                                title: 'WebView',
                                backgroundColor: ColorX.red,
                                onClicked: () {
                                  Get.to(DemoWebViewScreen());
                                },
                              )),
                              const SizedBox(width: 8.0),
                              Expanded(
                                  child: ButtonX(
                                title: 'HTML',
                                backgroundColor: ColorX.red,
                                onClicked: () {
                                  Get.to(DemoHtmlScreen());
                                },
                              )),
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          const ContainerX(
                            backgroundColor: ColorX.gray,
                            width: double.infinity,
                            padding: EdgeInsets.all(4.0),
                            cornerRadius: 8.0,
                            child: TextX('QR and Barcodes',
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                textAlign: TextAlign.center,
                                maxLines: 1),
                          ),
                          const SizedBox(height: 4.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: ButtonX(
                                  title: 'QR Code',
                                  backgroundColor: ColorX.teal,
                                  onClicked: () async {
                                    Get.to(DemoQRCodeScreen());
                                  },
                                ),
                              ),
                              const SizedBox(width: 8.0),
                              Expanded(
                                child: ButtonX(
                                  title: 'QR Scan',
                                  backgroundColor: ColorX.teal,
                                  onClicked: () async {
                                    Get.to(DemoQRScanScreen());
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          const ContainerX(
                            backgroundColor: ColorX.gray,
                            width: double.infinity,
                            padding: EdgeInsets.all(4.0),
                            cornerRadius: 8.0,
                            child: TextX('TabBar',
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                textAlign: TextAlign.center,
                                maxLines: 1),
                          ),
                          const SizedBox(height: 4.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: ButtonX(
                                  title: 'TabBar',
                                  backgroundColor: ColorX.green,
                                  onClicked: () async {
                                    Get.to(DemoTabBarScreen());
                                  },
                                ),
                              ),
                              const SizedBox(width: 8.0),
                              Expanded(
                                child: ButtonX(
                                  title: 'BottomNavBar',
                                  backgroundColor: ColorX.green,
                                  onClicked: () async {
                                    Get.to(DemoBottomNavBarScreen());
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          const ContainerX(
                            backgroundColor: ColorX.gray,
                            width: double.infinity,
                            padding: EdgeInsets.all(4.0),
                            cornerRadius: 8.0,
                            child: TextX('Share',
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                textAlign: TextAlign.center,
                                maxLines: 1),
                          ),
                          const SizedBox(height: 4.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: ButtonX(
                                  title: 'Text',
                                  backgroundColor: ColorX.yellow,
                                  onClicked: () {
                                    controller.demoShareText();
                                  },
                                ),
                              ),
                              const SizedBox(width: 8.0),
                              Expanded(
                                child: ButtonX(
                                  title: 'Image',
                                  backgroundColor: ColorX.yellow,
                                  onClicked: () {
                                    controller.demoShareImage();
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          const ContainerX(
                            backgroundColor: ColorX.gray,
                            width: double.infinity,
                            padding: EdgeInsets.all(4.0),
                            cornerRadius: 8.0,
                            child: TextX('Pickers',
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                textAlign: TextAlign.center,
                                maxLines: 1),
                          ),
                          const SizedBox(height: 4.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: ButtonX(
                                  title: 'Image Picker',
                                  backgroundColor: ColorX.red,
                                  onClicked: () {
                                    controller.demoImagePicker();
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          const ContainerX(
                            backgroundColor: ColorX.gray,
                            width: double.infinity,
                            padding: EdgeInsets.all(4.0),
                            cornerRadius: 8.0,
                            child: TextX('Crypto',
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                textAlign: TextAlign.center,
                                maxLines: 1),
                          ),
                          const SizedBox(height: 4.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: ButtonX(
                                  title: 'Base64',
                                  backgroundColor: ColorX.teal,
                                  onClicked: () async {
                                    Base64Utils.demo();
                                    final plain = LoremIpsumX.medium();
                                    var encoded = Base64Utils.encode(
                                        Utf8Utils.encode(plain));
                                    var decoded = Base64Utils.decode(encoded);

                                    SheetX.showMessage(
                                        title: 'Base64',
                                        message:
                                            'plain: $plain\nencoded: $encoded\ndecoded: ${Utf8Utils.decode(decoded)}',
                                        leftBtnTitle: 'OK',
                                        onLeftBtnClicked: () {
                                          Get.back();
                                        },
                                        rightBtnTitle: '',
                                        onRightBtnClicked: () {});
                                  },
                                ),
                              ),
                              const SizedBox(width: 8.0),
                              Expanded(
                                child: ButtonX(
                                  title: 'MD5',
                                  backgroundColor: ColorX.teal,
                                  onClicked: () async {
                                    Md5Utils.demo();
                                    final plain = LoremIpsumX.medium();
                                    final digest = Md5Utils.convert(
                                        Utf8Utils.encode(plain));

                                    SheetX.showMessage(
                                        title: 'MD5',
                                        message:
                                            'plain: $plain\ndigest: ${HexUtils.encode(digest)}',
                                        leftBtnTitle: 'OK',
                                        onLeftBtnClicked: () {
                                          Get.back();
                                        },
                                        rightBtnTitle: '',
                                        onRightBtnClicked: () {});
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: ButtonX(
                                  title: 'SHA',
                                  backgroundColor: ColorX.teal,
                                  onClicked: () async {
                                    ShaUtils.demo();
                                    final plain = LoremIpsumX.medium();
                                    final digest = ShaUtils.convert(
                                        Utf8Utils.encode(plain));

                                    SheetX.showMessage(
                                        title: 'SHA',
                                        message:
                                            'plain: $plain\ndigest: ${HexUtils.encode(digest)}',
                                        leftBtnTitle: 'OK',
                                        onLeftBtnClicked: () {
                                          Get.back();
                                        },
                                        rightBtnTitle: '',
                                        onRightBtnClicked: () {});
                                  },
                                ),
                              ),
                              const SizedBox(width: 8.0),
                              Expanded(
                                child: ButtonX(
                                  title: 'AES',
                                  backgroundColor: ColorX.teal,
                                  onClicked: () async {
                                    AesUtils.demo();
                                    final plain = LoremIpsumX.medium();
                                    const key =
                                        'd3b91f0ebf75cc407114307b0ed67f3cd3b91f0ebf75cc407114307b0ed67f3c';
                                    const iv =
                                        '89e4ea9f678d2e94d9548043f54db492';
                                    final encrypted = AesUtils.encrypt(
                                        Utf8Utils.encode(plain),
                                        HexUtils.decode(key),
                                        HexUtils.decode(iv));
                                    final decrypted = AesUtils.decrypt(
                                        encrypted,
                                        HexUtils.decode(key),
                                        HexUtils.decode(iv));
                                    LoggerX.log('[AES] plain: $plain\n');
                                    LoggerX.log(
                                        '[AES] encrypted: ${HexUtils.encode(encrypted)}\n');
                                    LoggerX.log(
                                        '[AES] decrypted: ${Utf8Utils.decode(decrypted)}\n');

                                    SheetX.showMessage(
                                        title: 'AES',
                                        message:
                                            'plain: $plain\nencrypted: ${HexUtils.encode(encrypted)}\ndecrypted: ${Utf8Utils.decode(decrypted)}',
                                        leftBtnTitle: 'OK',
                                        onLeftBtnClicked: () {
                                          Get.back();
                                        },
                                        rightBtnTitle: '',
                                        onRightBtnClicked: () {});
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: ButtonX(
                                  title: 'XOR',
                                  backgroundColor: ColorX.teal,
                                  onClicked: () async {
                                    XorUtils.demo();

                                    final plain = LoremIpsumX.medium();
                                    const key =
                                        '9b2611f319e2c88f1dce0a7a612bcf1f5b037bc66b9e8144725da7faf16cc3f2';
                                    final encrypted = XorUtils.encrypt(
                                        Utf8Utils.encode(plain),
                                        Utf8Utils.encode(key));
                                    final decrypted = XorUtils.decrypt(
                                        encrypted, Utf8Utils.encode(key));

                                    SheetX.showMessage(
                                        title: 'XOR',
                                        message:
                                            'plain: $plain\nencrypted: ${HexUtils.encode(encrypted)}\ndecrypted: $decrypted',
                                        leftBtnTitle: 'OK',
                                        onLeftBtnClicked: () {
                                          Get.back();
                                        },
                                        rightBtnTitle: '',
                                        onRightBtnClicked: () {});
                                  },
                                ),
                              ),
                              const SizedBox(width: 8.0),
                              Expanded(
                                child: ButtonX(
                                  title: 'CRC',
                                  backgroundColor: ColorX.teal,
                                  onClicked: () async {
                                    CrcUtils.demo();
                                    final plain = LoremIpsumX.medium();
                                    final value = CrcUtils.convert(
                                        Utf8Utils.encode(plain));

                                    SheetX.showMessage(
                                        title: 'CRC',
                                        message: 'plain: $plain\nCRC: $value',
                                        leftBtnTitle: 'OK',
                                        onLeftBtnClicked: () {
                                          Get.back();
                                        },
                                        rightBtnTitle: '',
                                        onRightBtnClicked: () {});
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: ButtonX(
                                  title: 'HEX',
                                  backgroundColor: ColorX.teal,
                                  onClicked: () async {
                                    HexUtils.demo();
                                    final plain = LoremIpsumX.medium();
                                    final encoded = HexUtils.encode(
                                        Utf8Utils.encode(plain));
                                    final decoded = HexUtils.decode(encoded);

                                    SheetX.showMessage(
                                        title: 'HEX',
                                        message:
                                            'plain: $plain\nencoded: $encoded\ndecoded: ${Utf8Utils.decode(decoded)}',
                                        leftBtnTitle: 'OK',
                                        onLeftBtnClicked: () {
                                          Get.back();
                                        },
                                        rightBtnTitle: '',
                                        onRightBtnClicked: () {});
                                  },
                                ),
                              ),
                              const SizedBox(width: 8.0),
                              Expanded(
                                child: ButtonX(
                                  title: 'DoubleEncrypt',
                                  backgroundColor: ColorX.teal,
                                  onClicked: () async {
                                    final plain = LoremIpsumX.medium();
                                    final encrypted =
                                        DemoSecurityVM.doubleEncrypt(
                                            Utf8Utils.encode(plain));
                                    final decrypted =
                                        DemoSecurityVM.doubleDecrypt(encrypted);

                                    SheetX.showMessage(
                                        title: 'DoubleEncrypt',
                                        message:
                                            'plain: $plain\nencrypted: ${HexUtils.encode(encrypted)}\ndecrypted: ${Utf8Utils.decode(decrypted)}',
                                        leftBtnTitle: 'OK',
                                        onLeftBtnClicked: () {
                                          Get.back();
                                        },
                                        rightBtnTitle: '',
                                        onRightBtnClicked: () {});
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )));
  }
}
