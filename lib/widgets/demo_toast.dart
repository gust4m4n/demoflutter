import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DemoToast {
  static FlashController? controller;

  static show({required String message}) {
//    Fluttertoast.showToast(msg: message);
  }

  static showCustom(
      {required Widget widget,
      required int duration,
      bool force = true}) async {
    if (DemoToast.controller != null) {
      if (force == true) {
        await DemoToast.dismissCustom();
      } else {
        return;
      }
    }
    DemoToast.controller = await showFlash(
        context: Get.context!,
        duration: duration == 0 ? null : Duration(milliseconds: duration),
        builder: (context, controller) {
          DemoToast.controller = controller;
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
    DemoToast.controller = null;
  }

  static dismissCustom() async {
    await DemoToast.controller?.dismiss();
    DemoToast.controller = null;
  }
}
