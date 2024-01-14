import 'package:get/get.dart';
import '../../viewmodels/demo_movie_list_vm.dart';

class DemoListViewController extends GetxController {
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
