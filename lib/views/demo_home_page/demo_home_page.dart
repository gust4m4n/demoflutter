import 'package:carousel_slider/carousel_slider.dart';
import '../../widgets/all_widgets.dart';
import '../demo_image_screen/demo_image_screen.dart';
import 'demo_home_controller.dart';
import 'demo_banner_cell.dart';
import 'demo_launcher_cell.dart';

class DemoHomePage extends StatelessWidget {
  DemoHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DemoHomeController>(
        init: DemoHomeController(),
        builder: (controller) => ScreenX(
            lightStatusBar: true,
            headerView: NavigationBarX(
              title: 'Beranda',
            ),
            bottomPadding: false,
            bodyView: Material(
              child: Scrollbar(
                  child: ListView(padding: EdgeInsets.zero, children: [
                SizedBox(
                    height: 100.0,
                    child: ListView.separated(
                        padding: EdgeInsets.all(8.0),
                        physics: ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) {
                          return ContainerX(width: 8.0);
                        },
                        itemCount: controller.movieListVM.list.length,
                        itemBuilder: (context, index) {
                          final movie = controller.movieListVM.list[index];
                          return Material(
                              color: ColorX.transparent,
                              child: InkWell(
                                  highlightColor: ColorX.highlight,
                                  onTap: () {
                                    Get.to(DemoImageScreen(url: movie.poster));
                                  },
                                  child: DemoBannerCell(movie)));
                        })),
                GridView.count(
                  shrinkWrap: true,
                  mainAxisSpacing: 0.0,
                  crossAxisSpacing: 0.0,
                  childAspectRatio: 0.84,
                  crossAxisCount: 4,
                  padding: EdgeInsets.all(8.0),
                  physics: ClampingScrollPhysics(),
                  children: [
                    DemoLauncherCell(
                        color: ColorX.green,
                        faIcon: FontAwesomeIcons.arrowRightArrowLeft,
                        title: 'Button 1'),
                    DemoLauncherCell(
                        color: ColorX.blue,
                        faIcon: FontAwesomeIcons.sackDollar,
                        title: 'Button 2'),
                    DemoLauncherCell(
                        color: ColorX.teal,
                        faIcon: FontAwesomeIcons.landmark,
                        title: 'Button 3'),
                    DemoLauncherCell(
                        color: ColorX.yellow,
                        faIcon: FontAwesomeIcons.handHoldingDollar,
                        title: 'Button 4'),
                    DemoLauncherCell(
                        color: ColorX.red,
                        faIcon: FontAwesomeIcons.qrcode,
                        title: 'Button 5'),
                    DemoLauncherCell(
                        color: ColorX.green,
                        faIcon: FontAwesomeIcons.houseFlag,
                        title: 'Button 6'),
                    DemoLauncherCell(
                        color: ColorX.blue,
                        faIcon: FontAwesomeIcons.circleDollarToSlot,
                        title: 'Button 7'),
                    DemoLauncherCell(
                        color: ColorX.gray,
                        faIcon: FontAwesomeIcons.ellipsis,
                        title: 'Button 8'),
                  ],
                ),
                controller.movieListVM.list.length > 0
                    ? CarouselSlider.builder(
                        options: CarouselOptions(
                          padEnds: false,
                          autoPlay: true,
                          viewportFraction: 0.85,
                          height: 180.0,
                          onPageChanged: (index, reason) {
                            controller.setPageIndex(index);
                          },
                        ),
                        itemCount: controller.movieListVM.list.length,
                        itemBuilder: (BuildContext context, int index,
                            int pageViewIndex) {
                          final movie = controller.movieListVM.list[index];
                          return Material(
                              color: ColorX.transparent,
                              child: InkWell(
                                  customBorder: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0)),
                                  highlightColor: ColorX.highlight,
                                  onTap: () {
                                    Get.to(DemoImageScreen(url: movie.poster));
                                  },
                                  child: Padding(
                                      padding: EdgeInsets.only(left: 8.0),
                                      child: ImageX(
                                        url: movie.poster,
                                        width: double.infinity,
                                        height: double.infinity,
                                        cornerRadius: 8.0,
                                        fit: BoxFit.cover,
                                      )))); //)));
                        })
                    : Container(),
                SizedBox(height: 8.0),
              ])),
            )));
  }
}
