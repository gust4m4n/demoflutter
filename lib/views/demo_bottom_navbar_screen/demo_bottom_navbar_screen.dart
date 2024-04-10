import '../../widgets/all_widgets.dart';
import '../demo_home_page/demo_home_page.dart';
import '../demo_profile_page/demo_profile_page.dart';
import 'demo_bottom_navbar_controller.dart';

// ignore: must_be_immutable
class DemoBottomNavBarScreen extends StatelessWidget {
  final int tabBarIndex;
  DemoBottomNavBarScreen({this.tabBarIndex = 0});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DemoBottomNavBarController>(
        init: DemoBottomNavBarController(tabBarIndex: tabBarIndex),
        builder: (controller) => ScreenX(
              bodyView: IndexedStack(
                index: controller.tabBarIndex,
                children: <Widget>[
                  DemoHomePage(),
                  DemoProfilePage(),
                ],
              ),
              bottomNavigationBar: Theme(
                data: ThemeData(
                  splashColor: ColorX.transparent,
                  highlightColor: ColorX.transparent,
                  hoverColor: ColorX.transparent,
                ),
                child: BottomNavigationBar(
                    backgroundColor: ColorX.white,
                    currentIndex: controller.tabBarIndex,
                    onTap: (index) {
                      controller.onChange(index);
                    },
                    type: BottomNavigationBarType.fixed,
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    elevation: 0.0,
                    items: [
                      BottomNavigationBarItem(
                          activeIcon: Column(
                            children: [
                              ImageX(
                                faIcon: FontAwesomeIcons.house,
                                height: 24.0,
                                width: 24.0,
                                color: ColorX.gray,
                              ),
                              SizedBox(height: 4.0),
                              TextX(
                                'Home',
                                fontSize: 15.0,
                                fontWeight: FontWeight.w500,
                                color: ColorX.gray,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          icon: Column(
                            children: [
                              ImageX(
                                faIcon: FontAwesomeIcons.house,
                                height: 24.0,
                                width: 24.0,
                                color: ColorX.gray.withOpacity(0.60),
                              ),
                              SizedBox(height: 4.0),
                              TextX(
                                'Home',
                                fontSize: 15.0,
                                fontWeight: FontWeight.w500,
                                color: ColorX.gray.withOpacity(0.60),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          label: ''),
                      BottomNavigationBarItem(
                          activeIcon: Column(
                            children: [
                              ImageX(
                                faIcon: FontAwesomeIcons.user,
                                height: 24.0,
                                width: 24.0,
                                color: ColorX.gray,
                              ),
                              SizedBox(height: 4.0),
                              TextX(
                                'Profile',
                                fontSize: 15.0,
                                fontWeight: FontWeight.w500,
                                color: ColorX.gray,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          icon: Column(
                            children: [
                              ImageX(
                                faIcon: FontAwesomeIcons.user,
                                height: 24.0,
                                width: 24.0,
                                color: ColorX.gray.withOpacity(0.60),
                              ),
                              SizedBox(height: 4.0),
                              TextX(
                                'Profile',
                                fontSize: 15.0,
                                fontWeight: FontWeight.w500,
                                color: ColorX.gray.withOpacity(0.60),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          label: ''),
                    ]),
              ),
            ));
  }
}
