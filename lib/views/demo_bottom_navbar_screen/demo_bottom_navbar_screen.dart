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
                      icon: ImageX(
                        faIcon: FontAwesomeIcons.house,
                        width: 20.0,
                        height: 20.0,
                        fit: BoxFit.contain,
                      ),
                      label: 'Home',
                      tooltip: '',
                    ),
                    BottomNavigationBarItem(
                      icon: ImageX(
                        faIcon: FontAwesomeIcons.user,
                        width: 20.0,
                        height: 20.0,
                        fit: BoxFit.contain,
                      ),
                      label: 'Profile',
                      tooltip: '',
                    ),
                  ],
                  currentIndex: controller.selectedTab,
                  unselectedFontSize: 13.0,
                  unselectedItemColor: ColorX.black,
                  selectedFontSize: 13.0,
                  selectedItemColor: ColorX.blue,
                  onTap: controller.onTabSelected,
                ),
              ]),
            ));
  }
}
