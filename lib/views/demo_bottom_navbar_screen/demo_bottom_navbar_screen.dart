import '../../widgets/all_widgets.dart';
import 'demo_bottom_navbar_controller.dart';

class DemoBottomNavBarScreen extends StatelessWidget {
  DemoBottomNavBarScreen({Key? key}) : super(key: key);

  backAction() {
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DemoBottomNavBarController>(
        init: DemoBottomNavBarController(),
        builder: (controller) => ScreenX(
              lightStatusBar: false,
              bottomPadding: false,
              bodyView: Column(children: [
                Expanded(
                  child: Center(
                      child: TextX(
                    controller.content,
                    color: Colors.black,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w700,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                  )),
                ),
                BottomNavigationBar(
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                      tooltip: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.business),
                      label: 'Business',
                      tooltip: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.school),
                      label: 'School',
                      tooltip: '',
                    ),
                  ],
                  currentIndex: controller.selectedTab,
                  unselectedFontSize: 13.0,
                  unselectedItemColor: const Color(0xff6c757d),
                  selectedFontSize: 13.0,
                  selectedItemColor: const Color(0xff007bff),
                  onTap: controller.onTabSelected,
                ),
              ]),
            ));
  }
}
