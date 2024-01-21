import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'all_widgets.dart';

class SheetX {
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
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(cornerRadius),
                topRight: Radius.circular(cornerRadius)),
          ),
          widget);
    } else {
      return showModalBottomSheet(
          backgroundColor: Colors.white,
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
          const ImageX(
            url: 'lib/images/ic_demo_sheet_grip.png',
            fit: BoxFit.contain,
            width: 42.0,
            height: 4.0,
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
        backgroundColor: Colors.white,
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

  static Future<T?> showMessage<T>(
      {String imageUrl = '',
      required String title,
      required String message,
      bool centered = true,
      required String leftBtnTitle,
      required VoidCallback onLeftBtnClicked,
      String rightBtnTitle = '',
      VoidCallback? onRightBtnClicked,
      bool autoClose = true}) {
    return SheetX.showContent(
        backgroundColor: Colors.white,
        cornerRadius: 24.0,
        avoidingKeyboard: false,
        contentMaxHeight: MediaQuery.of(Get.context!).size.height * 0.70,
        contentWidget: Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          child: Column(
            children: [
              Visibility(
                visible: imageUrl.isNotEmpty,
                child: Column(children: [
                  ImageX(
                    url: imageUrl,
                    width: 64.0,
                    height: 64.0,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 12.0),
                ]),
              ),
              TextX(
                title,
                color: const Color(0xff343a40),
                fontSize: 17.0,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.center,
                maxLines: 2048,
              ),
              const SizedBox(height: 8.0),
              TextX(
                message,
                color: const Color(0xff343a40),
                fontSize: 15.0,
                fontWeight: FontWeight.normal,
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
                  child: const SizedBox(width: 8.0)),
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

  static Future<T?> showMessageFA<T>(
      {IconData? iconData,
      required String title,
      required String message,
      required String leftBtnTitle,
      required VoidCallback onLeftBtnClicked,
      String rightBtnTitle = '',
      VoidCallback? onRightBtnClicked,
      bool autoClose = true}) {
    return SheetX.showContent(
        backgroundColor: Colors.white,
        cornerRadius: 24.0,
        avoidingKeyboard: false,
        contentMaxHeight: MediaQuery.of(Get.context!).size.height * 0.70,
        contentWidget: Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          child: Column(
            children: [
              Visibility(
                visible: iconData == null,
                child: Column(children: [
                  FaIcon(
                    iconData,
                    size: 64.0,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 12.0),
                ]),
              ),
              TextX(
                title,
                color: const Color(0xff343a40),
                fontSize: 17.0,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.center,
                maxLines: 2048,
              ),
              const SizedBox(height: 8.0),
              TextX(
                message,
                color: const Color(0xff343a40),
                fontSize: 15.0,
                fontWeight: FontWeight.normal,
                textAlign: TextAlign.center,
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
                    backgroundColor: Colors.red,
                    onClicked: onLeftBtnClicked,
                  ),
                ),
              ),
              Visibility(
                  visible: leftBtnTitle.isNotEmpty && rightBtnTitle.isNotEmpty,
                  child: const SizedBox(width: 8.0)),
              Visibility(
                visible: rightBtnTitle.isNotEmpty,
                child: Expanded(
                  child: ButtonX(
                    title: rightBtnTitle,
                    backgroundColor: Colors.black,
                    onClicked: onRightBtnClicked ?? () => {},
                  ),
                ),
              )
            ],
          ),
        ),
        autoClose: autoClose);
  }
}
