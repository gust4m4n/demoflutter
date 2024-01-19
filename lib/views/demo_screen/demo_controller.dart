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
      Share.shareFiles([pickedFile.path]);
    }
  }

  demoImagePicker() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      DemoSheet.showMessage(
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
    DemoSheet.showMessage(
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
    DemoToast.showCustom(
      widget: appxInternetOfflineWidget(),
      duration: 0,
    );
  }

  btnInternetOnlineClicked() {
    DemoToast.showCustom(
      widget: appxInternetOnlineWidget(),
      duration: 3500,
    );
  }
}
