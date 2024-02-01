import 'package:fl_chart/fl_chart.dart';
import '../../widgets/all_widgets.dart';
import 'demo_linechart_controller.dart';

class DemoLineChartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DemoLineChartController>(
      init: DemoLineChartController(),
      builder: (controller) => ScreenX(
          lightStatusBar: true,
          headerView: NavigationBarX(
            title: 'LineChart',
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
          bodyView: Container(
            padding: const EdgeInsets.all(16.0),
            child: LineChart(
              LineChartData(lineBarsData: [
                LineChartBarData(spots: controller.chartData),
              ]),
            ),
          )),
    );
  }
}
