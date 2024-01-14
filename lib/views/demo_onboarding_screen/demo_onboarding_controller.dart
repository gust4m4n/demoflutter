import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../viewmodels/demo_movie_list_vm.dart';

class DemoOnboardingController extends GetxController {
  final PageController pageController = PageController();
  var movieListVM = DemoMovieListVM();

  @override
  void onReady() {
    super.onReady();
    movieListVM.request().then((resp) {
      if (resp.statusCode == 200) {
        update();
      }
    });
  }
}
