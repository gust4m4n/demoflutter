import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class ToastX {
  static FlashController? controller;

  static show({required String message}) {
    Fluttertoast.showToast(msg: message);
  }

  static showCustom(
      {required Widget widget,
      required int duration,
      bool force = true}) async {
    if (ToastX.controller != null) {
      if (force == true) {
        await ToastX.dismissCustom();
      } else {
        return;
      }
    }
    ToastX.controller = await showFlash(
        context: Get.context!,
        duration: duration == 0 ? null : Duration(milliseconds: duration),
        builder: (context, controller) {
          ToastX.controller = controller;
          return FlashBar(
            shadowColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            controller: controller,
            behavior: FlashBehavior.floating,
            position: FlashPosition.bottom,
            padding: EdgeInsets.all(0.0),
            dismissDirections: const [FlashDismissDirection.vertical],
            content: widget,
          );
        });
    ToastX.controller = null;
  }

  static dismissCustom() async {
    await ToastX.controller?.dismiss();
    ToastX.controller = null;
  }
}
