import '../../widgets/all_widgets.dart';

class DemoPinController extends GetxController {
  String pin = '';
  String error = '';

  btnBackClicked() {
    Get.back();
  }

  btnCloseClicked() {
    Get.back(result: '');
  }

  btnKeypadClicked(String digit) {
    if (pin.length < 6) {
      pin = pin + digit;
      if (pin.length == 6) {
        submit();
      }
    }
    update();
  }

  btnFingerprintClicked() {}

  btnBackspaceClicked() {
    if (pin.length > 0) {
      pin = pin.substring(0, pin.length - 1);
    }
    update();
  }

  btnForgotPinClicked() {
    Get.back(result: '');
  }

  clear(String error) {
    pin = '';
    this.error = error;
    update();
  }

  submit() {
    Get.loading();
    Future.delayed(Duration(milliseconds: 2000), () {
      if (pin == '999999') {
        Get.back(result: pin);
      } else {
        clear('PIN yang anda masukkan salah. PIN sebenarnya adalah 999999.');
      }
      Get.back();
    });
  }
}
