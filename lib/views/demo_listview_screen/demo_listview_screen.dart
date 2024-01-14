import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/container_x.dart';
import '../../widgets/navigationbar_x.dart';
import '../../widgets/screen_x.dart';
import '../demo_image_screen/demo_image_screen.dart';
import 'demo_listview_controller.dart';
import 'demo_listview_cell.dart';

class DemoListViewScreen extends StatelessWidget {
  DemoListViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DemoListViewController>(
      init: DemoListViewController(),
      builder: (controller) => ScreenX(
          lightStatusBar: true,
          headerView: NavigationBarX(
            title: 'ListView',
            leftIcon: 'lib/images/ic_demo_back.png',
            leftIconColor: Colors.white,
            leftAction: () {
              Get.back();
            },
          ),
          bottomPadding: false,
          bodyView: Scrollbar(
            child: Material(
                child: ListView.separated(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(Get.context!).padding.bottom),
                    physics: ClampingScrollPhysics(),
                    separatorBuilder: (context, index) {
                      return Padding(
                          padding: EdgeInsets.only(left: 16.0),
                          child: ContainerX(
                            height: 0.5,
                            width: double.infinity,
                            backgroundColor: Colors.grey,
                          ));
                    },
                    itemCount: controller.movieListVM.list.length,
                    itemBuilder: (context, index) {
                      final movie = controller.movieListVM.list[index];
                      return Material(
                          color: Colors.transparent,
                          child: InkWell(
                              highlightColor: const Color(0xffE3E3E3),
                              onTap: () {
                                Get.to(DemoImageScreen(url: movie.poster));
                              },
                              child: DemoListViewCell(movie)));
                    })),
          )),
    );
  }
}
