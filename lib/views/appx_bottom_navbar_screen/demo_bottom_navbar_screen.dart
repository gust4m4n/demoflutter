import '../../widgets/all_widgets.dart';
import 'demo_bottom_navbar_controller.dart';

// ignore: must_be_immutable
class DemoBottomNavBarScreen extends StatelessWidget {
  final int tabBarIndex;
  DemoBottomNavBarScreen({this.tabBarIndex = 0});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DemoBottomNavBarController>(
        init: DemoBottomNavBarController(tabBarIndex: tabBarIndex),
        builder: (controller) => AnnotatedRegion<SystemUiOverlayStyle>(
              value: StatusBarX.theme,
              child: Scaffold(
                backgroundColor: Color(0XFFE5E5E5),
                body: _body(controller),
                bottomNavigationBar: BottomNavigationBar(
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
                                color: ColorX.blue,
                              ),
                              SizedBox(height: 4.0),
                              TextX(
                                'Home',
                                fontSize: 15.0,
                                fontWeight: FontWeight.w600,
                                color: ColorX.blue,
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
                                color: ColorX.gray,
                              ),
                              SizedBox(height: 4.0),
                              TextX(
                                'Home',
                                fontSize: 15.0,
                                fontWeight: FontWeight.w600,
                                color: ColorX.gray,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          label: ''),
                      BottomNavigationBarItem(
                          activeIcon: Column(
                            children: [
                              ImageX(
                                faIcon: FontAwesomeIcons.database,
                                height: 24.0,
                                width: 24.0,
                                color: ColorX.blue,
                              ),
                              SizedBox(height: 4.0),
                              TextX(
                                'Database',
                                fontSize: 15.0,
                                fontWeight: FontWeight.w600,
                                color: ColorX.blue,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          icon: Column(
                            children: [
                              ImageX(
                                faIcon: FontAwesomeIcons.database,
                                height: 24.0,
                                width: 24.0,
                                color: ColorX.gray,
                              ),
                              SizedBox(height: 4.0),
                              TextX(
                                'Database',
                                fontSize: 15.0,
                                fontWeight: FontWeight.w600,
                                color: ColorX.gray,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          label: ''),
                      BottomNavigationBarItem(
                          activeIcon: Column(
                            children: [
                              ImageX(
                                faIcon: FontAwesomeIcons.chartSimple,
                                height: 24.0,
                                width: 24.0,
                                color: ColorX.blue,
                              ),
                              SizedBox(height: 4.0),
                              TextX(
                                'Charts',
                                fontSize: 15.0,
                                fontWeight: FontWeight.w600,
                                color: ColorX.blue,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          icon: Column(
                            children: [
                              ImageX(
                                faIcon: FontAwesomeIcons.chartSimple,
                                height: 24.0,
                                width: 24.0,
                                color: ColorX.gray,
                              ),
                              SizedBox(height: 4.0),
                              TextX(
                                'Charts',
                                fontSize: 15.0,
                                fontWeight: FontWeight.w600,
                                color: ColorX.gray,
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
                                color: ColorX.blue,
                              ),
                              SizedBox(height: 4.0),
                              TextX(
                                'Profile',
                                fontSize: 15.0,
                                fontWeight: FontWeight.w600,
                                color: ColorX.blue,
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
                                color: ColorX.gray,
                              ),
                              SizedBox(height: 4.0),
                              TextX(
                                'Profile',
                                fontSize: 15.0,
                                fontWeight: FontWeight.w600,
                                color: ColorX.gray,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          label: ''),
                      BottomNavigationBarItem(
                          activeIcon: Column(
                            children: [
                              ImageX(
                                faIcon: FontAwesomeIcons.gear,
                                height: 24.0,
                                width: 24.0,
                                color: ColorX.blue,
                              ),
                              SizedBox(height: 4.0),
                              TextX(
                                'Settings',
                                fontSize: 15.0,
                                fontWeight: FontWeight.w600,
                                color: ColorX.blue,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          icon: Column(
                            children: [
                              ImageX(
                                faIcon: FontAwesomeIcons.gear,
                                height: 24.0,
                                width: 24.0,
                                color: ColorX.gray,
                              ),
                              SizedBox(height: 4.0),
                              TextX(
                                'Settings',
                                fontSize: 15.0,
                                fontWeight: FontWeight.w600,
                                color: ColorX.gray,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          label: ''),
                    ]),
              ),
            ));
  }

  _body(DemoBottomNavBarController controller) {
    return IndexedStack(
      index: controller.tabBarIndex,
      children: <Widget>[
        ContainerX(backgroundColor: ColorX.blue),
        ContainerX(backgroundColor: ColorX.teal),
        ContainerX(backgroundColor: ColorX.green),
        ContainerX(backgroundColor: ColorX.red),
        ContainerX(backgroundColor: ColorX.yellow),
      ],
    );
  }
}
