import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'button_x.dart';
import 'colors_x.dart';
import 'image_x.dart';
import 'text_x.dart';

class DialogX {
  static Future<T?> show<T>(
      {required Color backgroundColor,
      required double cornerRadius,
      required Widget widget}) {
    return Get.dialog(
        AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
            Radius.circular(cornerRadius),
          )),
          backgroundColor: backgroundColor,
          contentPadding: const EdgeInsets.all(0.0),
          content: widget,
        ),
        transitionDuration: Duration.zero,
        transitionCurve: null);
  }

  static Future<T?> showContent<T>(
      {required Color backgroundColor,
      required double cornerRadius,
      required double contentMaxHeight,
      required Widget contentWidget,
      required Widget footerWidget}) {
    return DialogX.show(
        backgroundColor: backgroundColor,
        cornerRadius: 8.0,
        widget: Column(mainAxisSize: MainAxisSize.min, children: [
          const SizedBox(height: 16.0),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: contentMaxHeight,
            ),
            child: Scrollbar(
                child: SingleChildScrollView(
              child: contentWidget,
            )),
          ),
          footerWidget
        ]));
  }

  static Future<T?> showMessage<T>({
    String imageUrl = '',
    required String title,
    required String message,
    required String leftBtnTitle,
    required GestureTapCallback onLeftBtnClicked,
    required String rightBtnTitle,
    required GestureTapCallback onRightBtnClicked,
  }) {
    return DialogX.showContent(
      backgroundColor: Colors.white,
      cornerRadius: 8.0,
      contentMaxHeight: MediaQuery.of(Get.context!).size.height * 0.70,
      contentWidget: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Column(
          children: [
            Visibility(
              visible: imageUrl.isNotEmpty,
              child: Column(children: [
                ImageX(
                  url: imageUrl,
                  width: 160.0,
                  height: 160.0,
                ),
                const SizedBox(height: 12.0),
              ]),
            ),
            TextX(
              title,
              color: ColorX.black,
              fontSize: 17.0,
              fontWeight: FontWeight.w600,
              textAlign: TextAlign.center,
              maxLines: 2048,
            ),
            const SizedBox(height: 8.0),
            TextX(
              message,
              color: ColorX.black,
              fontSize: 15.0,
              fontWeight: FontWeight.normal,
              textAlign: TextAlign.center,
              maxLines: 2048,
            ),
          ],
        ),
      ),
      footerWidget: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: ButtonX(
                title: leftBtnTitle,
                backgroundColor: ColorX.green,
                onClicked: onLeftBtnClicked,
              ),
            ),
            Visibility(
                visible: rightBtnTitle.isNotEmpty,
                child: const SizedBox(width: 4.0)),
            Visibility(
              visible: rightBtnTitle.isNotEmpty,
              child: Expanded(
                child: ButtonX(
                  title: rightBtnTitle,
                  backgroundColor: ColorX.red,
                  onClicked: onRightBtnClicked,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  static loading() {
    Get.dialog(
        AlertDialog(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          content: const Center(
            child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
          ),
        ),
        transitionDuration: Duration.zero,
        transitionCurve: null);
  }
}
