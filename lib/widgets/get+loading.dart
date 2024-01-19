import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension Loading on GetInterface {
  void loading() {
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
