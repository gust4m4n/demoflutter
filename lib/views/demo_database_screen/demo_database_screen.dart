import 'package:demoflutter/models/demo_movie_model.dart';
import 'package:demoflutter/viewmodels/demo_database_vm.dart';
import '../../utils/all_utils.dart';
import '../../widgets/all_widgets.dart';
import '../demo_image_screen/demo_image_screen.dart';
import 'demo_database_controller.dart';
import 'demo_database_cell.dart';

class DemoDatabaseScreen extends StatelessWidget {
  DemoDatabaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DemoDatabaseController>(
      init: DemoDatabaseController(),
      builder: (controller) => ScreenX(
          lightStatusBar: true,
          loading: controller.loading,
          headerView: NavigationBarX(
            title: 'Database',
            leftBtn: ImageX(
              faIcon: FontAwesomeIcons.arrowLeft,
              width: 20.0,
              height: 20.0,
              color: Colors.white,
              fit: BoxFit.contain,
            ),
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
                    itemCount: controller.row_ids.length,
                    itemBuilder: (context, index) {
                      LoggerX.log('Loading row: $index');
                      return FutureBuilder<DemoMovieModel>(
                          future: DemoDatabaseVM.db
                              .movieLoad(controller.row_ids[index]),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              var movie = snapshot.data;
                              return Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                      highlightColor: ColorX.highlight,
                                      onTap: () {
                                        Get.to(
                                            DemoImageScreen(url: movie.poster));
                                      },
                                      child: DemoDatabaseCell(movie!)));
                            } else {
                              return DemoDatabaseCell(DemoMovieModel());
                            }
                          });
                    })),
          )),
    );
  }
}
