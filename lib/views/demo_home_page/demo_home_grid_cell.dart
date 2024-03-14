import '../../models/demo_movie_model.dart';
import '../../widgets/all_widgets.dart';

// ignore: must_be_immutable
class DemoHomeGridCell extends StatelessWidget {
  final DemoMovieModel movie;
  DemoHomeGridCell(this.movie);

  @override
  Widget build(BuildContext context) {
    final width =
        ((MediaQuery.of(Get.context!).size.width - (8.0 * 2)) - (4.0 * 16.0)) /
            4.0;
    return ContainerX(
        child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                ImageX(
                  url: movie.poster,
                  width: width,
                  height: width,
                  cornerRadius: 8.0,
                  placeholderColor: ColorX.lightGray,
                ),
                TextX(
                  movie.title,
                  color: ColorX.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.center,
                  maxLines: 3,
                ),
                Spacer()
              ],
            )));
  }
}
