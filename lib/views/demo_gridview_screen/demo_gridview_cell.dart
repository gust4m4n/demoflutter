import '../../models/demo_movie_model.dart';
import '../../viewmodels/demo_format_vm.dart';
import '../../widgets/all_widgets.dart';

// ignore: must_be_immutable
class DemoGridViewCell extends StatelessWidget {
  final DemoMovieModel movie;
  DemoGridViewCell(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        ImageX(
          url: movie.poster,
          width: double.infinity,
          height: (MediaQuery.of(Get.context!).size.width / 2.0) - 16.0,
          cornerRadius: 8.0,
          placeholderColor: ColorX.lightGray,
        ),
        Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Column(children: <Widget>[
              const SizedBox(height: 4.0),
              TextX(
                movie.title,
                color: ColorX.black,
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
              const SizedBox(height: 4.0),
              TextX(
                DemoFormatVM.currencyUSD(value: movie.revenue),
                color: ColorX.black,
                fontSize: 17.0,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
                maxLines: 1,
              ),
            ])),
      ],
    ));
  }
}
