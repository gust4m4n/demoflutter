import 'all_widgets.dart';

extension Loading on GetInterface {
  void loading() {
    Get.dialog(
        AlertDialog(
          backgroundColor: ColorX.transparent,
          shadowColor: ColorX.transparent,
          content: const Center(
            child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(ColorX.white)),
          ),
        ),
        transitionDuration: Duration.zero,
        transitionCurve: null);
  }
}
