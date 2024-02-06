import '../../widgets/all_widgets.dart';
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
              loading: controller.movieListVM.list.isEmpty &&
                  controller.movieListVM.loading,
              headerView: NavigationBarX(
                title: 'ListView',
                leftBtn: ImageX(
                  faIcon: FontAwesomeIcons.arrowLeft,
                  width: 20.0,
                  height: 20.0,
                  color: ColorX.white,
                  fit: BoxFit.contain,
                ),
                leftAction: () {
                  controller.btnBackClicked();
                },
              ),
              bottomPadding: false,
              bodyView: NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification scrollInfo) {
                    if (controller.movieListVM.loading == false &&
                        scrollInfo.metrics.pixels ==
                            scrollInfo.metrics.maxScrollExtent) {
                      controller.nextPage();
                    }
                    return true;
                  },
                  child: Material(
                    child: Scrollbar(
                        child: ListView.separated(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(Get.context!).padding.bottom),
                            physics: ClampingScrollPhysics(),
                            separatorBuilder: (context, index) {
                              return Padding(
                                  padding: EdgeInsets.only(left: 16.0),
                                  child: ContainerX(
                                    height: 1.0,
                                    width: double.infinity,
                                    backgroundColor: ColorX.lightGray,
                                  ));
                            },
                            itemCount: controller.movieListVM.list.length,
                            itemBuilder: (context, index) {
                              final movie = controller.movieListVM.list[index];
                              return Material(
                                  color: ColorX.transparent,
                                  child: InkWell(
                                      highlightColor: ColorX.highlight,
                                      onTap: () {
                                        Get.to(
                                            DemoImageScreen(url: movie.poster));
                                      },
                                      child: DemoListViewCell(movie)));
                            })),
                  )),
            ));
  }
}
