import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';

class DemoLineChartController extends GetxController {
  List<FlSpot> chartData = [
    FlSpot(0, 1),
    FlSpot(1, 3),
    FlSpot(2, 10),
    FlSpot(3, 7),
    FlSpot(4, 12),
    FlSpot(5, 13),
    FlSpot(6, 17),
    FlSpot(7, 15),
    FlSpot(8, 20),
  ];
  
  @override
  void onReady() {
    super.onReady();
  }
}
