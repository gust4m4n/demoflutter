import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';

class DemoLineChartController extends GetxController {
  List<FlSpot> chartData = [
    FlSpot(1, 400),
    FlSpot(2, 800),
    FlSpot(3, 500),
    FlSpot(4, 100),
    FlSpot(5, 300),
    FlSpot(6, 300),
  ];

  @override
  void onReady() {
    super.onReady();
  }

  btnBackClicked() {
    Get.back();
  }
}
