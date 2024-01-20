import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'all_widgets.dart';

class ToastX {
  static FlashController? controller;

  static show({required String msg}) {
    ToastX.snackBarCustom(
      widget: BasicToast(msg: msg),
      duration: 4000,
    );
  }

  static snackBar({required String msg}) {
    ToastX.snackBarCustom(
      widget: BasicSnackBar(msg: msg),
      duration: 4000,
    );
  }

  static snackBarCustom(
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

class BasicToast extends StatelessWidget {
  final String msg;
  BasicToast({required this.msg});

  @override
  Widget build(BuildContext context) {
    return ContainerX(
      backgroundColor: ColorX.transparent,
      padding: EdgeInsets.all(16.0),
      child: Center(
        child: ContainerX(
          backgroundColor: ColorX.black.withOpacity(0.85),
          padding: EdgeInsets.all(16.0),
          cornerRadius: 16.0,
          child: Wrap(children: [
            TextX(
              msg,
              color: Colors.white,
              fontSize: 15.0,
              fontWeight: FontWeight.w500,
              textAlign: TextAlign.center,
              maxLines: 16,
            ),
          ]),
        ),
      ),
    );
  }
}

class BasicSnackBar extends StatelessWidget {
  final String msg;
  BasicSnackBar({required this.msg});

  @override
  Widget build(BuildContext context) {
    return ContainerX(
      backgroundColor: ColorX.black.withOpacity(0.85),
      padding: EdgeInsets.all(16.0),
      child: Wrap(children: [
        TextX(
          msg,
          color: Colors.white,
          fontSize: 15.0,
          fontWeight: FontWeight.w500,
          textAlign: TextAlign.start,
          maxLines: 16,
        ),
      ]),
    );
  }
}
