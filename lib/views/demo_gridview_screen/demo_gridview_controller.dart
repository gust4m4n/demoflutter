import 'package:get/get.dart';
import '../../viewmodels/demo_movie_list_vm.dart';

class DemoGridViewController extends GetxController {
  var movieListVM = DemoMovieListVM();

  @override
  void onReady() {
    super.onReady();
    update();
    movieListVM.request().then((resp) {
      update();
    });
  }
}
