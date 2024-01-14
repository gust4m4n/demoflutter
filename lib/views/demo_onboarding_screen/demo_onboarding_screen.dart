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
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        left: 16.0,
                                        right: 16.0,
                                        top: 16.0,
                                        bottom: 16.0),
                                    child: ImageX(
                                      url: movie.poster,
                                      width: double.infinity,
                                      placeholderColor: Colors.transparent,
                                      cornerRadius: 16.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 120.0,
                                  padding: const EdgeInsets.only(
                                      left: 16.0, right: 16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      TextX(
                                        movie.title,
                                        color: Colors.black,
                                        fontSize: 36.0,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w700,
                                        textAlign: TextAlign.center,
                                        maxLines: 2048,
                                      ),
                                      const SizedBox(height: 8.0),
                                      TextX(
                                        DemoFormatVM.currency(
                                            value: movie.revenue),
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w700,
                                        textAlign: TextAlign.center,
                                        maxLines: 2048,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ))
                        .toList(),
                  ),
                ),
                ContainerX(
                    padding: const EdgeInsets.only(
                        left: 16.0, top: 16.0, right: 16.0, bottom: 16.0),
                    child: SmoothPageIndicator(
                      controller: controller.pageController,
                      count: controller.movieListVM.list.length,
                      effect: SlideEffect(
                        dotHeight: 8,
                        dotWidth: 8,
                        dotColor: const Color(0XFF2A6482).withOpacity(0.2),
                        activeDotColor: const Color(0XFF2A6482),
                      ),
                    )),
                ContainerX(
                    padding: const EdgeInsets.only(
                        left: 16.0, top: 16.0, right: 16.0, bottom: 16.0),
                    child: ButtonX(
                      title: 'Next',
                      backgroundColor: Colors.green,
                      onClicked: () {
                        Get.back();
                      },
                    ))
              ],
            )));
  }
}
