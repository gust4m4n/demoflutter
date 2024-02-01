import 'dart:ui';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';

class DemoPieChartController extends GetxController {
  List<PieChartSectionData> pieChartSectionData = [
    PieChartSectionData(
      value: 20,
      title: '20%',
      color: Color(0xffed733f),
    ),
    PieChartSectionData(
      value: 35,
      title: '35%',
      color: Color(0xff584f84),
    ),
    PieChartSectionData(
      value: 15,
      title: '15%',
      color: Color(0xffd86f9b),
    ),
    PieChartSectionData(
      value: 30,
      title: '30%',
      color: Color(0xffa2663e),
    ),
  ];

  @override
  void onReady() {
    super.onReady();
  }
}
