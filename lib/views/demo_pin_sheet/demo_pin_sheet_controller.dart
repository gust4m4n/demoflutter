import '../../widgets/all_widgets.dart';

class DemoPinSheetController extends GetxController {
  String code = '';
  String error = '';

  btnCloseClicked() {
    Get.back();
  }

  btnKeypadClicked(String digit) {
    if (code.length < 6) {
      code = code + digit;
      if (code.length == 6) {
        submit();
      }
    }
    update();
  }

  btnFingerprintClicked() {}

  btnBackspaceClicked() {
    if (code.length > 0) {
      code = code.substring(0, code.length - 1);
    }
    update();
  }

  btnForgotPinClicked() {
    Get.back();
  }

  clear(String error) {
    code = '';
    this.error = error;
    update();
  }

  submit() {
    Get.loading();
    Future.delayed(Duration(milliseconds: 2000), () {
      final hardcodedCode = '123456';
      if (code == hardcodedCode) {
        Get.back(result: code);
      } else {
        clear(
            'PIN yang anda masukkan salah. PIN sebenarnya adalah $hardcodedCode.');
      }
      Get.back();
    });
  }
}
