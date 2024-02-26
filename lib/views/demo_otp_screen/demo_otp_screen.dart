import '../../widgets/all_widgets.dart';
import 'demo_otp_controller.dart';

// ignore: must_be_immutable
class DemoOtpScreen extends GetWidget<DemoOtpController> {
  final String title;
  TextEditingController pinController = TextEditingController();

  DemoOtpScreen({this.title = 'Enter your OTP'});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DemoOtpController>(
        init: DemoOtpController(),
        builder: (controller) => ScreenX(
            lightStatusBar: true,
            headerView: NavigationBarX(
              title: title,
              leftBtn: ImageX(
                faIcon: FontAwesomeIcons.arrowLeft,
                width: 20.0,
                height: 20.0,
                color: ColorX.white,
                fit: BoxFit.contain,
              ),
              leftAction: () {
                controller.btnBackClicked();
              },
            ),
            bottomPadding: true,
            bodyView: Center(
                child: ContainerX(
                    backgroundColor: ColorX.white,
                    child: Wrap(children: [
                      ContainerX(height: 8.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ContainerX(
                            backgroundColor: ColorX.transparent,
                            width: 32.0,
                            height: 32.0,
                            cornerRadius: 8.0,
                            borderWidth: 1.0,
                            borderColor: ColorX.gray,
                            child: Center(
                                child: TextX(
                              controller.pin.length >= 1
                                  ? controller.pin[0]
                                  : '',
                              fontSize: 17.0,
                              fontWeight: FontWeight.w700,
                            )),
                          ),
                          SizedBox(width: 8.0),
                          ContainerX(
                            backgroundColor: ColorX.transparent,
                            width: 32.0,
                            height: 32.0,
                            cornerRadius: 8.0,
                            borderWidth: 1.0,
                            borderColor: ColorX.gray,
                            child: Center(
                                child: TextX(
                              controller.pin.length >= 2
                                  ? controller.pin[1]
                                  : '',
                              fontSize: 17.0,
                              fontWeight: FontWeight.w700,
                            )),
                          ),
                          SizedBox(width: 8.0),
                          ContainerX(
                            backgroundColor: ColorX.transparent,
                            width: 32.0,
                            height: 32.0,
                            cornerRadius: 8.0,
                            borderWidth: 1.0,
                            borderColor: ColorX.gray,
                            child: Center(
                                child: TextX(
                              controller.pin.length >= 3
                                  ? controller.pin[2]
                                  : '',
                              fontSize: 17.0,
                              fontWeight: FontWeight.w700,
                            )),
                          ),
                          SizedBox(width: 8.0),
                          ContainerX(
                            backgroundColor: ColorX.transparent,
                            width: 32.0,
                            height: 32.0,
                            cornerRadius: 8.0,
                            borderWidth: 1.0,
                            borderColor: ColorX.gray,
                            child: Center(
                                child: TextX(
                              controller.pin.length >= 4
                                  ? controller.pin[3]
                                  : '',
                              fontSize: 17.0,
                              fontWeight: FontWeight.w700,
                            )),
                          ),
                          SizedBox(width: 8.0),
                          ContainerX(
                            backgroundColor: ColorX.transparent,
                            width: 32.0,
                            height: 32.0,
                            cornerRadius: 8.0,
                            borderWidth: 1.0,
                            borderColor: ColorX.gray,
                            child: Center(
                                child: TextX(
                              controller.pin.length >= 5
                                  ? controller.pin[4]
                                  : '',
                              fontSize: 17.0,
                              fontWeight: FontWeight.w700,
                            )),
                          ),
                          SizedBox(width: 8.0),
                          ContainerX(
                            backgroundColor: ColorX.transparent,
                            width: 32.0,
                            height: 32.0,
                            cornerRadius: 8.0,
                            borderWidth: 1.0,
                            borderColor: ColorX.gray,
                            child: Center(
                                child: TextX(
                              controller.pin.length >= 6
                                  ? controller.pin[5]
                                  : '',
                              fontSize: 17.0,
                              fontWeight: FontWeight.w700,
                            )),
                          ),
                        ],
                      ),
                      ContainerX(height: 8.0),
                      Visibility(
                        visible: controller.error.isNotEmpty,
                        child: Padding(
                          padding: EdgeInsets.only(left: 48.0, right: 48.0),
                          child: TextX(
                            controller.error,
                            color: ColorX.red,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                            textAlign: TextAlign.center,
                            maxLines: 3,
                          ),
                        ),
                      ),
                      ContainerX(
                        backgroundColor: ColorX.white,
                        child: Column(
                          children: [
                            SizedBox(height: 24.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ButtonX(
                                  width: 64.0,
                                  height: 64.0,
                                  cornerRadius: 32.0,
                                  borderWidth: 1.0,
                                  borderColor: ColorX.lightGray,
                                  backgroundColor: Color(0xffFAFAFA),
                                  titleColor: ColorX.black,
                                  title: '1',
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w700,
                                  onClicked: () {
                                    controller.btnKeypadClicked('1');
                                  },
                                ),
                                SizedBox(width: 24.0),
                                ButtonX(
                                  width: 64.0,
                                  height: 64.0,
                                  cornerRadius: 32.0,
                                  borderWidth: 1.0,
                                  borderColor: ColorX.lightGray,
                                  backgroundColor: Color(0xffFAFAFA),
                                  titleColor: ColorX.black,
                                  title: '2',
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w700,
                                  onClicked: () {
                                    controller.btnKeypadClicked('2');
                                  },
                                ),
                                SizedBox(width: 24.0),
                                ButtonX(
                                  width: 64.0,
                                  height: 64.0,
                                  cornerRadius: 32.0,
                                  borderWidth: 1.0,
                                  borderColor: ColorX.lightGray,
                                  backgroundColor: Color(0xffFAFAFA),
                                  titleColor: ColorX.black,
                                  title: '3',
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w700,
                                  onClicked: () {
                                    controller.btnKeypadClicked('3');
                                  },
                                )
                              ],
                            ),
                            SizedBox(height: 12.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ButtonX(
                                  width: 64.0,
                                  height: 64.0,
                                  cornerRadius: 32.0,
                                  borderWidth: 1.0,
                                  borderColor: ColorX.lightGray,
                                  backgroundColor: Color(0xffFAFAFA),
                                  titleColor: ColorX.black,
                                  title: '4',
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w700,
                                  onClicked: () {
                                    controller.btnKeypadClicked('4');
                                  },
                                ),
                                SizedBox(width: 24.0),
                                ButtonX(
                                  width: 64.0,
                                  height: 64.0,
                                  cornerRadius: 32.0,
                                  borderWidth: 1.0,
                                  borderColor: ColorX.lightGray,
                                  backgroundColor: Color(0xffFAFAFA),
                                  titleColor: ColorX.black,
                                  title: '5',
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w700,
                                  onClicked: () {
                                    controller.btnKeypadClicked('5');
                                  },
                                ),
                                SizedBox(width: 24.0),
                                ButtonX(
                                  width: 64.0,
                                  height: 64.0,
                                  cornerRadius: 32.0,
                                  borderWidth: 1.0,
                                  borderColor: ColorX.lightGray,
                                  backgroundColor: Color(0xffFAFAFA),
                                  titleColor: ColorX.black,
                                  title: '6',
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w700,
                                  onClicked: () {
                                    controller.btnKeypadClicked('6');
                                  },
                                )
                              ],
                            ),
                            SizedBox(height: 12.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ButtonX(
                                  width: 64.0,
                                  height: 64.0,
                                  cornerRadius: 32.0,
                                  borderWidth: 1.0,
                                  borderColor: ColorX.lightGray,
                                  backgroundColor: Color(0xffFAFAFA),
                                  titleColor: ColorX.black,
                                  title: '7',
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w700,
                                  onClicked: () {
                                    controller.btnKeypadClicked('7');
                                  },
                                ),
                                SizedBox(width: 24.0),
                                ButtonX(
                                  width: 64.0,
                                  height: 64.0,
                                  cornerRadius: 32.0,
                                  borderWidth: 1.0,
                                  borderColor: ColorX.lightGray,
                                  backgroundColor: Color(0xffFAFAFA),
                                  titleColor: ColorX.black,
                                  title: '8',
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w700,
                                  onClicked: () {
                                    controller.btnKeypadClicked('8');
                                  },
                                ),
                                SizedBox(width: 24.0),
                                ButtonX(
                                  width: 64.0,
                                  height: 64.0,
                                  cornerRadius: 32.0,
                                  borderWidth: 1.0,
                                  borderColor: ColorX.lightGray,
                                  backgroundColor: Color(0xffFAFAFA),
                                  titleColor: ColorX.black,
                                  title: '9',
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w700,
                                  onClicked: () {
                                    controller.btnKeypadClicked('9');
                                  },
                                )
                              ],
                            ),
                            SizedBox(height: 12.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ContainerX(
                                    backgroundColor: ColorX.transparent,
                                    width: 64.0,
                                    height: 64.0),
                                SizedBox(width: 24.0),
                                ButtonX(
                                  width: 64.0,
                                  height: 64.0,
                                  cornerRadius: 32.0,
                                  borderWidth: 1.0,
                                  borderColor: ColorX.lightGray,
                                  backgroundColor: Color(0xffFAFAFA),
                                  titleColor: ColorX.black,
                                  title: '0',
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w700,
                                  onClicked: () {
                                    controller.btnKeypadClicked('0');
                                  },
                                ),
                                SizedBox(width: 24.0),
                                ButtonX(
                                  faIcon: FontAwesomeIcons.deleteLeft,
                                  faColor: ColorX.black,
                                  width: 64.0,
                                  height: 64.0,
                                  cornerRadius: 32.0,
                                  borderWidth: 1.0,
                                  borderColor: ColorX.lightGray,
                                  backgroundColor: Color(0xffFAFAFA),
                                  titleColor: ColorX.black,
                                  title: '',
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w700,
                                  onClicked: () {
                                    controller.btnBackspaceClicked();
                                  },
                                )
                              ],
                            ),
                            SizedBox(height: 12.0),
                            ButtonX(
                              title: 'Resend OTP',
                              titleColor: ColorX.black,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w700,
                              backgroundColor: ColorX.transparent,
                              width: 120.0,
                              height: 32.0,
                              cornerRadius: 16.0,
                              onClicked: () {
                                controller.btnResendOtpClicked();
                              },
                            ),
                          ],
                        ),
                      ),
                      ContainerX(height: 24.0),
                    ])))));
  }
}
