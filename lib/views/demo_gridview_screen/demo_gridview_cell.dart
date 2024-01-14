import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/demo_movie_model.dart';
import '../../viewmodels/demo_format_vm.dart';
import '../../widgets/image_x.dart';
import '../../widgets/text_x.dart';

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
          placeholderColor: const Color(0xffDFE5F0),
        ),
        Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Column(children: <Widget>[
              const SizedBox(height: 4.0),
              TextX(
                movie.title,
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
              const SizedBox(height: 4.0),
              TextX(
                DemoFormatVM.currency(value: movie.revenue),
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
                maxLines: 1,
              ),
            ])),
      ],
    ));
  }
}
