import 'package:demoflutter/widgets/colors_x.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../viewmodels/demo_format_vm.dart';
import '../../widgets/button_x.dart';
import '../../widgets/container_x.dart';
import '../../widgets/image_x.dart';
import '../../widgets/screen_x.dart';
import '../../widgets/text_x.dart';
import 'demo_onboarding_controller.dart';

class DemoOnboardingScreen extends StatelessWidget {
  DemoOnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DemoOnboardingController>(
        init: DemoOnboardingController(),
        builder: (controller) => ScreenX(
            lightStatusBar: false,
            topPadding: true,
            bottomPadding: true,
            bodyView: Column(
              children: [
                Expanded(
                  child: PageView(
                    controller: controller.pageController,
                    children: controller.movieListVM.list
                        .map((movie) => Column(
                              children: [
                                Expanded(
                                  child: ImageX(
                                    url: movie.poster,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                ContainerX(
                                  width: double.infinity,
                                  height: 150.0,
                                  padding: const EdgeInsets.only(
                                      left: 24.0,
                                      top: 16.0,
                                      right: 24.0,
                                      bottom: 16.0),
                                  child: Center(
                                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextX(
                                        movie.title,
                                        color: ColorX.black,
                                        fontSize: 32.0,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w700,
                                        textAlign: TextAlign.center,
                                        maxLines: 2048,
                                      ),
                                      const SizedBox(height: 8.0),
                                      TextX(
                                        DemoFormatVM.currency(
                                            value: movie.revenue),
                                        color: ColorX.black,
                                        fontSize: 16.0,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w700,
                                        textAlign: TextAlign.center,
                                        maxLines: 2048,
                                      ),
                                    ],
                                  )),
                                ),
                              ],
                            ))
                        .toList(),
                  ),
                ),
                ContainerX(
                    padding: const EdgeInsets.only(
                        left: 24.0, top: 4.0, right: 24.0, bottom: 4.0),
                    child: SmoothPageIndicator(
                      controller: controller.pageController,
                      count: controller.movieListVM.list.length,
                      effect: SlideEffect(
                        dotHeight: 8,
                        dotWidth: 8,
                        dotColor: ColorX.gray.withOpacity(0.2),
                        activeDotColor: ColorX.gray,
                      ),
                    )),
                ContainerX(
                    padding: const EdgeInsets.only(
                        left: 16.0, top: 16.0, right: 16.0, bottom: 16.0),
                    child: ButtonX(
                      title: 'Next',
                      backgroundColor: ColorX.green,
                      onClicked: () {
                        Get.back();
                      },
                    ))
              ],
            )));
  }
}
