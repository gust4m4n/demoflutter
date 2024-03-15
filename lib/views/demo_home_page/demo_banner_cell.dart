import '../../models/demo_movie_model.dart';
import '../../widgets/all_widgets.dart';

// ignore: must_be_immutable
class DemoBannerCell extends StatelessWidget {
  final DemoMovieModel movie;
  DemoBannerCell(this.movie);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.0,
      child: ImageX(
        url: movie.poster,
        cornerRadius: 12.0,
        fit: BoxFit.cover,
      ),
    );
  }
}
