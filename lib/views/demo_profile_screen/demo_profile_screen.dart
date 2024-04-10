import '../../viewmodels/demo_profile_vm.dart';
import '../../widgets/all_widgets.dart';
import 'demo_profile_controller.dart';

class DemoProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DemoProfileController>(
        init: DemoProfileController(),
        builder: (controller) => ScreenX(
            lightStatusBar: true,
            topPadding: false,
            bottomPadding: true,
            bodyView: Column(children: [
              ContainerX(
                  width: double.infinity,
                  backgroundColor: ColorX.theme,
                  padding: EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      SizedBox(height: MediaQuery.of(Get.context!).padding.top),
                      ContainerX(
                          backgroundColor: ColorX.white,
                          width: 110.0,
                          height: 110.0,
                          cornerRadius: 55.0,
                          child: Center(
                              child: ImageX(
                            faIcon: DemoProfileVM.profile.photo.isEmpty
                                ? FontAwesomeIcons.user
                                : null,
                            color: DemoProfileVM.profile.photo.isEmpty
                                ? ColorX.gray
                                : null,
                            url: DemoProfileVM.profile.photo,
                            width: DemoProfileVM.profile.photo.isEmpty
                                ? 50.0
                                : 100.0,
                            height: 100.0,
                            cornerRadius: 50.0,
                          ))),
                      SizedBox(height: 8.0),
                      TextX(
                        DemoProfileVM.profile.name.isEmpty
                            ? '-'
                            : DemoProfileVM.profile.name,
                        fontSize: 17.0,
                        fontWeight: FontWeight.w700,
                        color: ColorX.white,
                      ),
                      TextX(
                        DemoProfileVM.profile.email.isEmpty
                            ? '-'
                            : DemoProfileVM.profile.email,
                        fontSize: 13.0,
                        fontWeight: FontWeight.w400,
                        color: ColorX.white,
                      ),
                    ],
                  )),
              SizedBox(
                height: 12.0,
              ),
              ContainerX(
                  padding: EdgeInsets.only(
                      left: 16.0, top: 0.0, right: 16.0, bottom: 0.0),
                  child: Material(
                    color: ColorX.transparent,
                    child: InkWell(
                        highlightColor: ColorX.highlight,
                        customBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        onTap: () {
                          Get.back();
                        },
                        child: ContainerX(
                            padding: EdgeInsets.only(
                                left: 8.0, top: 8.0, right: 8.0, bottom: 8.0),
                            child: Row(
                              children: [
                                ContainerX(
                                  width: 40.0,
                                  height: 40.0,
                                  cornerRadius: 20.0,
                                  backgroundColor:
                                      ColorX.theme.withOpacity(0.1),
                                  child: Center(
                                    child: ImageX(
                                      faIcon: FontAwesomeIcons.clock,
                                      width: 20.0,
                                      height: 20.0,
                                      color: ColorX.black,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8.0,
                                ),
                                TextX(
                                  'History',
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w500,
                                  color: ColorX.black,
                                ),
                                Spacer(),
                                ImageX(
                                  faIcon: FontAwesomeIcons.chevronRight,
                                  width: 16.0,
                                  height: 16.0,
                                  color: ColorX.black,
                                  fit: BoxFit.contain,
                                )
                              ],
                            ))),
                  )),
              ContainerX(
                  padding: EdgeInsets.only(
                      left: 16.0, top: 0.0, right: 16.0, bottom: 0.0),
                  child: Material(
                    color: ColorX.transparent,
                    child: InkWell(
                        highlightColor: ColorX.highlight,
                        customBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        onTap: () {
                          Get.back();
                        },
                        child: ContainerX(
                            padding: EdgeInsets.only(
                                left: 8.0, top: 8.0, right: 8.0, bottom: 8.0),
                            child: Row(
                              children: [
                                ContainerX(
                                  width: 40.0,
                                  height: 40.0,
                                  cornerRadius: 20.0,
                                  backgroundColor:
                                      ColorX.theme.withOpacity(0.1),
                                  child: Center(
                                    child: ImageX(
                                      faIcon: FontAwesomeIcons.gear,
                                      width: 20.0,
                                      height: 20.0,
                                      color: ColorX.black,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8.0,
                                ),
                                TextX(
                                  'Settings',
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w500,
                                  color: ColorX.black,
                                ),
                                Spacer(),
                                ImageX(
                                  faIcon: FontAwesomeIcons.chevronRight,
                                  width: 16.0,
                                  height: 16.0,
                                  color: ColorX.black,
                                  fit: BoxFit.contain,
                                )
                              ],
                            ))),
                  )),
              ContainerX(
                  padding: EdgeInsets.only(
                      left: 16.0, top: 0.0, right: 16.0, bottom: 0.0),
                  child: Material(
                    color: ColorX.transparent,
                    child: InkWell(
                        highlightColor: ColorX.highlight,
                        customBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        onTap: () {
                          Get.back();
                        },
                        child: ContainerX(
                            padding: EdgeInsets.only(
                                left: 8.0, top: 8.0, right: 8.0, bottom: 8.0),
                            child: Row(
                              children: [
                                ContainerX(
                                  width: 40.0,
                                  height: 40.0,
                                  cornerRadius: 20.0,
                                  backgroundColor:
                                      ColorX.theme.withOpacity(0.1),
                                  child: Center(
                                    child: ImageX(
                                      faIcon: FontAwesomeIcons.shieldHalved,
                                      width: 20.0,
                                      height: 20.0,
                                      color: ColorX.black,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8.0,
                                ),
                                TextX(
                                  'Privacy and Policy',
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w500,
                                  color: ColorX.black,
                                ),
                                Spacer(),
                                ImageX(
                                  faIcon: FontAwesomeIcons.chevronRight,
                                  width: 16.0,
                                  height: 16.0,
                                  color: ColorX.black,
                                  fit: BoxFit.contain,
                                )
                              ],
                            ))),
                  )),
              ContainerX(
                  padding: EdgeInsets.only(
                      left: 16.0, top: 0.0, right: 16.0, bottom: 0.0),
                  child: Material(
                    color: ColorX.transparent,
                    child: InkWell(
                        highlightColor: ColorX.highlight,
                        customBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        onTap: () {
                          Get.back();
                        },
                        child: ContainerX(
                            padding: EdgeInsets.only(
                                left: 8.0, top: 8.0, right: 8.0, bottom: 8.0),
                            child: Row(
                              children: [
                                ContainerX(
                                  width: 40.0,
                                  height: 40.0,
                                  cornerRadius: 20.0,
                                  backgroundColor:
                                      ColorX.theme.withOpacity(0.1),
                                  child: Center(
                                    child: ImageX(
                                      faIcon: FontAwesomeIcons.powerOff,
                                      width: 20.0,
                                      height: 20.0,
                                      color: ColorX.black,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8.0,
                                ),
                                TextX(
                                  'Sign Out',
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w500,
                                  color: ColorX.black,
                                ),
                                Spacer(),
                                ImageX(
                                  faIcon: FontAwesomeIcons.chevronRight,
                                  width: 16.0,
                                  height: 16.0,
                                  color: ColorX.black,
                                  fit: BoxFit.contain,
                                )
                              ],
                            ))),
                  )),
              Spacer(),
              Padding(
                padding: EdgeInsets.all(24.0),
                child: TextX(
                  controller.version,
                  fontSize: 13.0,
                  fontWeight: FontWeight.w500,
                  color: ColorX.black,
                ),
              ),
            ])));
  }
}
