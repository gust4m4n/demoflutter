import 'dart:async';
import 'package:image_picker/image_picker.dart';
import '../../utils/all_utils.dart';
import '../../widgets/all_widgets.dart';
import '../demo_bottom_navbar_screen/demo_bottom_navbar_screen.dart';
import '../demo_carousel_screen/demo_carousel_screen.dart';
import '../demo_database_screen/demo_database_screen.dart';
import '../demo_drawer_screen/demo_drawer_screen.dart';
import '../demo_gridview_screen/demo_gridview_screen.dart';
import '../demo_html_screen/demo_html_screen.dart';
import '../demo_image_screen/demo_image_screen.dart';
import '../demo_linechart_screen/demo_linechart_screen.dart';
import '../demo_listview_screen/demo_listview_screen.dart';
import '../demo_login_screen/demo_login_screen.dart';
import '../demo_onboarding_screen/demo_onboarding_screen.dart';
import '../demo_otp_screen/demo_otp_screen.dart';
import '../demo_piechart_screen/demo_piechart_screen.dart';
import '../demo_pin_screen/demo_pin_screen.dart';
import '../demo_pin_sheet/demo_pin_sheet.dart';
import '../demo_qr_code_screen/demo_qr_code_screen.dart';
import '../demo_qr_scan_screen/demo_qr_scan_screen.dart';
import '../demo_receipt_screen/demo_receipt_screen.dart';
import '../demo_tabbar_screen/demo_tabbar_screen.dart';
import '../demo_webview_screen/demo_webview_screen.dart';

class DemoController extends GetxController {
  @override
  void onReady() {
    super.onReady();
  }

  btnOnboardingClicked() {
    Get.to(DemoOnboardingScreen());
  }

  btnLoginClicked() {
    Get.to(DemoLoginScreen(), popGesture: true);
  }

  btnOtpClicked() {
    Get.to(DemoOtpScreen());
  }

  btnPinClicked() {
    Get.to(DemoPinScreen());
  }

  btnPinSheetClicked() {
    final sheet = DemoPinSheet();
    sheet.show().then((value) {
      LoggerX.log('PIN: $value');
    });
  }

  btnListViewClicked() {
    Get.to(DemoListViewScreen(), popGesture: true);
  }

  btnGridViewClicked() {
    Get.to(DemoGridViewScreen(), popGesture: true);
  }

  btnDrawerClicked() {
    Get.to(DemoDrawerScreen());
  }

  btnImageClicked() {
    Get.to(DemoImageScreen(
      url:
          'https://assets-prd.ignimgs.com/2023/04/27/transformers-rise-of-the-beast-new-button-1682603563738.jpg',
    ));
  }

  btnCarouselClicked() {
    Get.to(DemoCarouselScreen());
  }

  btnDatabaseClicked() {
    Get.to(DemoDatabaseScreen());
  }

  btnWebViewClicked() {
    Get.to(DemoWebViewScreen());
  }

  btnHtmlClicked() {
    Get.to(DemoHtmlScreen());
  }

  btnQrCodeClicked() {
    Get.to(DemoQRCodeScreen());
  }

  btnQrScanClicked() {
    Get.to(DemoQRScanScreen());
  }

  btnTabBarClicked() {
    Get.to(DemoTabBarScreen());
  }

  btnBottomNavBarClicked() {
    Get.to(DemoBottomNavBarScreen());
  }

  btnShareTextClicked() {
    Share.share('Check out my website https://example.com');
  }

  btnShareImageClicked() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      Share.shareXFiles([pickedFile]);
    }
  }

  btnReceiptClicked() {
    Get.to(DemoReceiptScreen(
      details: {
        'Order ID': 'AB00001',
        'Total': 'Rp100.000',
        'Tax (8%)': 'Rp8.000',
        '-': '',
        'Grand Total': 'Rp108.000',
      },
    ));
  }

  btnImagePickerClicked() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      SheetX.showMessage(
          title: 'Image Picker',
          message: pickedFile.path,
          leftBtnTitle: 'OK',
          onLeftBtnClicked: () {
            Get.back();
          },
          rightBtnTitle: '',
          onRightBtnClicked: () {});
    }
  }

  btnDialogClicked() {
    DialogX.showMessage(
        icon: ImageX(
          url: 'lib/images/ic_demo_logo.png',
          width: 64.0,
          height: 64.0,
          fit: BoxFit.contain,
        ),
        title: LoremIpsumX.tiny(),
        message: LoremIpsumX.medium(),
        leftBtnTitle: 'OK',
        onLeftBtnClicked: () {
          Get.back();
        },
        rightBtnTitle: 'Cancel',
        onRightBtnClicked: () {
          Get.back();
        });
  }

  btnBottomSheetClicked() {
    SheetX.showMessage(
        icon: ImageX(
          url: 'lib/images/ic_demo_logo.png',
          width: 64.0,
          height: 64.0,
          fit: BoxFit.contain,
        ),
        title: LoremIpsumX.tiny(),
        message: LoremIpsumX.medium(),
        leftBtnTitle: 'OK',
        onLeftBtnClicked: () {
          Get.back();
        },
        rightBtnTitle: 'Cancel',
        onRightBtnClicked: () {
          Get.back();
        });
  }

  btnInternetOfflineClicked() {
    ToastX.snackBarCustom(
      widget: InternetOfflineToast(),
      duration: 0,
    );
  }

  btnInternetOnlineClicked() {
    ToastX.snackBarCustom(
      widget: InternetOnlineToast(),
      duration: 4000,
    );
  }

  btnLoadingClicked() {
    Get.loading();
    Timer(Duration(seconds: 5), () {
      Get.back();
    });
  }

  btnToastClicked() {
    ToastX.show(msg: LoremIpsumX.medium());
  }

  btnSnackBarClicked() {
    ToastX.snackBar(msg: LoremIpsumX.medium());
  }

  btnLineChartClicked() {
    Get.to(DemoLineChartScreen());
  }

  btnPieChartClicked() {
    Get.to(DemoPieChartScreen());
  }
}
