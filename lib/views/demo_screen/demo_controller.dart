import 'dart:async';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';
import '../../utils/all_utils.dart';
import '../../widgets/all_widgets.dart';

class DemoController extends GetxController {
  @override
  void onReady() {
    super.onReady();
  }

  demoShareText() {
    Share.share('check out my website https://example.com');
  }

  demoShareImage() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      Share.shareXFiles([pickedFile]);
    }
  }

  demoImagePicker() async {
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

  btnBottomSheetClicked() {
    SheetX.showMessage(
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
}
