import 'all_widgets.dart';

class SheetX {
  static Future<T?> showMessage<T>(
      {Widget? icon,
      required String title,
      required String message,
      bool centered = true,
      required String leftBtnTitle,
      required VoidCallback onLeftBtnClicked,
      String rightBtnTitle = '',
      VoidCallback? onRightBtnClicked,
      bool autoClose = true}) {
    return SheetX.showContent(
        backgroundColor: ColorX.white,
        cornerRadius: 24.0,
        avoidingKeyboard: false,
        contentMaxHeight: MediaQuery.of(Get.context!).size.height * 0.70,
        contentWidget: Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          child: Column(
            children: [
              Visibility(
                visible: icon != null,
                child: Column(children: [
                  icon ?? Container(),
                  const SizedBox(height: 12.0),
                ]),
              ),
              TextX(
                title,
                color: ColorX.black,
                fontSize: 17.0,
                fontWeight: FontWeight.w700,
                textAlign: TextAlign.center,
                maxLines: 2048,
              ),
              const SizedBox(height: 8.0),
              TextX(
                message,
                color: ColorX.black,
                fontSize: 17.0,
                fontWeight: FontWeight.w400,
                textAlign: centered ? TextAlign.center : TextAlign.start,
                maxLines: 2048,
              ),
            ],
          ),
        ),
        footerWidget: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            children: <Widget>[
              Visibility(
                visible: leftBtnTitle.isNotEmpty,
                child: Expanded(
                  child: ButtonX(
                    title: leftBtnTitle,
                    backgroundColor: ColorX.green,
                    onClicked: onLeftBtnClicked,
                  ),
                ),
              ),
              Visibility(
                  visible: leftBtnTitle.isNotEmpty && rightBtnTitle.isNotEmpty,
                  child: const SizedBox(width: 4.0)),
              Visibility(
                visible: rightBtnTitle.isNotEmpty,
                child: Expanded(
                  child: ButtonX(
                    title: rightBtnTitle,
                    backgroundColor: ColorX.red,
                    onClicked: onRightBtnClicked ?? () => {},
                  ),
                ),
              )
            ],
          ),
        ),
        autoClose: autoClose);
  }

  static Future<T?> show<T>(
      {required Color backgroundColor,
      required double cornerRadius,
      required bool avoidingKeyboard,
      required Widget widget,
      bool autoClose = true}) {
    FocusManager.instance.primaryFocus?.unfocus();
    if (avoidingKeyboard == true) {
      return Get.bottomSheet(
          isDismissible: autoClose,
          isScrollControlled: true,
          ignoreSafeArea: true,
          backgroundColor: ColorX.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(cornerRadius),
                topRight: Radius.circular(cornerRadius)),
          ),
          widget);
    } else {
      return showModalBottomSheet(
          backgroundColor: ColorX.white,
          isDismissible: autoClose,
          isScrollControlled: true,
          useSafeArea: false,
          context: Get.context!,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(cornerRadius),
                topRight: Radius.circular(cornerRadius)),
          ),
          builder: (context) {
            return widget;
          });
    }
  }

  static Future<T?> showWithGrip<T>(
      {required Color backgroundColor,
      required double cornerRadius,
      required bool avoidingKeyboard,
      required Widget widget,
      bool autoClose = true}) {
    return SheetX.show(
        backgroundColor: backgroundColor,
        cornerRadius: cornerRadius,
        avoidingKeyboard: avoidingKeyboard,
        widget: Column(mainAxisSize: MainAxisSize.min, children: [
          const SizedBox(height: 16.0),
          ContainerX(
            backgroundColor: ColorX.gray.withOpacity(0.3),
            width: 54.0,
            height: 4.0,
            cornerRadius: 2.0,
          ),
          const SizedBox(height: 16.0),
          widget
        ]),
        autoClose: autoClose);
  }

  static Future<T?> showContent<T>(
      {required Color backgroundColor,
      required double cornerRadius,
      required bool avoidingKeyboard,
      required double contentMaxHeight,
      required Widget contentWidget,
      required Widget footerWidget,
      bool autoClose = true}) {
    return SheetX.showWithGrip(
        backgroundColor: ColorX.white,
        cornerRadius: 24.0,
        avoidingKeyboard: avoidingKeyboard,
        widget: Column(children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: contentMaxHeight,
            ),
            child: Scrollbar(
                child: SingleChildScrollView(
              child: contentWidget,
            )),
          ),
          footerWidget,
          SizedBox(height: MediaQuery.of(Get.context!).padding.bottom)
        ]),
        autoClose: autoClose);
  }
}
