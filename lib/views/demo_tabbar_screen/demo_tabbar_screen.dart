import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/navigationbar_x.dart';
import '../../widgets/screen_x.dart';
import '../../widgets/text_x.dart';
import 'demo_tabbar_controller.dart';

class DemoTabBarScreen extends StatelessWidget {
  DemoTabBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DemoTabBarController>(
        init: DemoTabBarController(),
        builder: (controller) => ScreenX(
              headerView: NavigationBarX(
                title: 'TabBar',
                leftIcon: 'lib/images/ic_demo_back.png',
                leftIconColor: Colors.white,
                leftAction: () {
                  Get.back();
                },
              ),
              lightStatusBar: true,
              bottomPadding: true,
              bodyView: Column(
                children: [
                  TabBar(
                    controller: controller.tabController,
                    indicatorColor: Color(0xff7029C2),
                    indicatorWeight: 2.0,
                    tabs: const [
                      Tab(
                        text: 'Tab 1',
                      ),
                      Tab(text: 'Tab 2'),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: controller.tabController,
                      children: const [
                        Center(
                          child: const TextX(
                            'Page 1',
                            color: Colors.black,
                            fontSize: 22.0,
                            fontWeight: FontWeight.w700,
                            textAlign: TextAlign.start,
                            maxLines: 1,
                          ),
                        ),
                        Center(
                          child: const TextX(
                            'Page 2',
                            color: Colors.black,
                            fontSize: 22.0,
                            fontWeight: FontWeight.w700,
                            textAlign: TextAlign.start,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ));
  }
}