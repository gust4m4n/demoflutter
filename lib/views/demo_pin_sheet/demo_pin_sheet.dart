import '../../widgets/all_widgets.dart';
import 'demo_pin_controller.dart';

// ignore: must_be_immutable
class DemoPinSheet extends GetWidget<DemoPinController> {
  final String title;
  double buttonSize = 60.0;
  TextEditingController pinController = TextEditingController();

  DemoPinSheet({this.title = 'Demo PIN Sheet'});

  Future<T?> show<T>() {
    FocusManager.instance.primaryFocus?.unfocus();
    return SheetX.showWithGrip(
        backgroundColor: Colors.white,
        cornerRadius: 32.0,
        avoidingKeyboard: false,
        widget: this);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DemoPinController>(
        init: DemoPinController(),
        builder: (controller) => ContainerX(
            backgroundColor: Colors.white,
            topLeftRadius: 32.0,
            topRightRadius: 32.0,
            child: Wrap(children: [
              ContainerX(height: 8.0),
              Container(
                margin: EdgeInsets.only(left: 32.0, right: 32.0),
                child: Row(
                  children: [
                    ButtonX(
                      backgroundColor: ColorX.transparent,
                      faIcon: FontAwesomeIcons.xmark,
                      faWidth: 16.0,
                      faHeight: 16.0,
                      faColor: ColorX.black,
                      width: 32.0,
                      height: 32.0,
                      cornerRadius: 25.0,
                      borderWidth: 1.0,
                      borderColor: ColorX.black,
                      onClicked: () {
                        controller.btnCloseClicked();
                      },
                    ),
                    Expanded(
                      child: TextX(
                        title,
                        color: ColorX.black,
                        fontSize: 17.0,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(width: 32.0, height: 32.0),
                  ],
                ),
              ),
              ContainerX(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ContainerX(
                    backgroundColor: controller.pin.length >= 1
                        ? ColorX.black
                        : ColorX.transparent,
                    width: 12.0,
                    height: 12,
                    cornerRadius: 6.0,
                    borderWidth: 1.0,
                    borderColor: ColorX.black,
                  ),
                  SizedBox(width: 8.0),
                  ContainerX(
                    backgroundColor: controller.pin.length >= 2
                        ? ColorX.black
                        : ColorX.transparent,
                    width: 12.0,
                    height: 12,
                    cornerRadius: 6.0,
                    borderWidth: 1.0,
                    borderColor: ColorX.black,
                  ),
                  SizedBox(width: 8.0),
                  ContainerX(
                    backgroundColor: controller.pin.length >= 3
                        ? ColorX.black
                        : ColorX.transparent,
                    width: 12.0,
                    height: 12,
                    cornerRadius: 6.0,
                    borderWidth: 1.0,
                    borderColor: ColorX.black,
                  ),
                  SizedBox(width: 8.0),
                  ContainerX(
                    backgroundColor: controller.pin.length >= 4
                        ? ColorX.black
                        : ColorX.transparent,
                    width: 12.0,
                    height: 12,
                    cornerRadius: 6.0,
                    borderWidth: 1.0,
                    borderColor: ColorX.black,
                  ),
                  SizedBox(width: 8.0),
                  ContainerX(
                    backgroundColor: controller.pin.length >= 5
                        ? ColorX.black
                        : ColorX.transparent,
                    width: 12.0,
                    height: 12,
                    cornerRadius: 6.0,
                    borderWidth: 1.0,
                    borderColor: ColorX.black,
                  ),
                  SizedBox(width: 8.0),
                  ContainerX(
                    backgroundColor: controller.pin.length >= 6
                        ? ColorX.black
                        : ColorX.transparent,
                    width: 12.0,
                    height: 12,
                    cornerRadius: 6.0,
                    borderWidth: 1.0,
                    borderColor: ColorX.black,
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
                backgroundColor: Colors.white,
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
                          borderColor: ColorX.black,
                          backgroundColor: ColorX.transparent,
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
                          borderColor: ColorX.black,
                          backgroundColor: ColorX.transparent,
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
                          borderColor: ColorX.black,
                          backgroundColor: ColorX.transparent,
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
                          borderColor: ColorX.black,
                          backgroundColor: ColorX.transparent,
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
                          borderColor: ColorX.black,
                          backgroundColor: ColorX.transparent,
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
                          borderColor: ColorX.black,
                          backgroundColor: ColorX.transparent,
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
                          borderColor: ColorX.black,
                          backgroundColor: ColorX.transparent,
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
                          borderColor: ColorX.black,
                          backgroundColor: ColorX.transparent,
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
                          borderColor: ColorX.black,
                          backgroundColor: ColorX.transparent,
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
                          borderColor: ColorX.black,
                          backgroundColor: ColorX.transparent,
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
                          faColor: Color(0xff555555),
                          width: 64.0,
                          height: 64.0,
                          cornerRadius: 32.0,
                          borderWidth: 1.0,
                          borderColor: ColorX.black,
                          backgroundColor: ColorX.transparent,
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
                      title: 'Forgot PIN?',
                      titleColor: ColorX.black,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w700,
                      backgroundColor: ColorX.transparent,
                      width: 120.0,
                      height: 32.0,
                      cornerRadius: 16.0,
                      onClicked: () {
                        controller.btnForgotPinClicked();
                      },
                    ),
                  ],
                ),
              ),
              ContainerX(height: 24.0),
            ])));
  }
}
