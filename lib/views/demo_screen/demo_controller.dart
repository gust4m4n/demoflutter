import 'dart:async';
import 'package:demoflutter/views/demo_bottom_navbar_screen/demo_bottom_navbar_screen.dart';
import 'package:demoflutter/views/demo_otp_screen/demo_otp_screen.dart';
import 'package:demoflutter/views/demo_piechart_screen/demo_piechart_screen.dart';
import 'package:demoflutter/views/demo_pin_sheet/demo_pin_sheet.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';
import '../../utils/all_utils.dart';
import '../../widgets/all_widgets.dart';
import '../demo_carousel_screen/demo_carousel_screen.dart';
import '../demo_database_screen/demo_database_screen.dart';
import '../demo_image_screen/demo_image_screen.dart';
import '../demo_linechart_screen/demo_linechart_screen.dart';
import '../demo_onboarding_screen/demo_onboarding_screen.dart';
import '../demo_pin_screen/demo_pin_screen.dart';

class DemoController extends GetxController {
  @override
  void onReady() {
    super.onReady();
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

  btnTabBarClicked() {
    Get.to(DemoBottomNavBarScreen());
  }

  btnOnboardingClicked() {
    Get.to(DemoOnboardingScreen());
  }

  btnPinSheetClicked() {
    final sheet = DemoPinSheet();
    sheet.show().then((value) {
      LoggerX.log('PIN: $value');
    });
  }

  btnPinClicked() {
    Get.to(DemoPinScreen());
  }

  btnOtpClicked() {
    Get.to(DemoOtpScreen());
  }

  btnLineChartClicked() {
    Get.to(DemoLineChartScreen());
  }

  btnPieChartClicked() {
    Get.to(DemoPieChartScreen());
  }
}
