import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../widgets/all_widgets.dart';
import 'demo_login_controller.dart';

class DemoLoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DemoLoginController>(
        init: DemoLoginController(),
        builder: (controller) => ScreenX(
            lightStatusBar: false,
            topPadding: true,
            bottomPadding: true,
            bodyView: Scrollbar(
                child: SingleChildScrollView(
                    child: Column(
              children: <Widget>[
                SizedBox(height: 24.0),
                ImageX(
                  url: 'lib/images/ic_demo_logo.png',
                  width: 128.0,
                  height: 128.0,
                ),
                SizedBox(
                  height: 4.0,
                ),
                ContainerX(
                  padding: const EdgeInsets.only(
                      left: 24.0, top: 8.0, right: 24.0, bottom: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextX(
                        'Username',
                        color: ColorX.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(height: 4.0),
                      TextFieldX(
                        hint: 'Type your username',
                        obscureText: false,
                        keyboardType: TextInputType.text,
                        readOnly: false,
                        controller: controller.txtUsernameController,
                      ),
                    ],
                  ),
                ),
                ContainerX(
                  padding: const EdgeInsets.only(
                      left: 24.0, top: 8.0, right: 24.0, bottom: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextX(
                        'Password',
                        color: ColorX.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(height: 4.0),
                      TextFieldX(
                        hint: 'Type your password',
                        obscureText: controller.securedPassword,
                        keyboardType: TextInputType.text,
                        readOnly: false,
                        rightIcon: ImageX(
                          faIcon: controller.securedPassword
                              ? FontAwesomeIcons.eyeSlash
                              : FontAwesomeIcons.eye,
                          width: 16.0,
                          height: 16.0,
                          fit: BoxFit.contain,
                        ),
                        rightIconColor: controller.securedPassword
                            ? Colors.grey
                            : ColorX.black,
                        rightAction: () {
                          controller.securedPassword =
                              !controller.securedPassword;
                          controller.update();
                        },
                        controller: controller.txtPasswordController,
                      ),
                    ],
                  ),
                ),
                ContainerX(
                  padding: const EdgeInsets.only(
                      left: 24.0, top: 8.0, right: 24.0, bottom: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextX(
                        'Role',
                        color: ColorX.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(height: 4.0),
                      TextFieldX(
                          hint: 'Select your role...',
                          obscureText: false,
                          keyboardType: TextInputType.text,
                          readOnly: true,
                          rightIcon: ImageX(
                            faIcon: FontAwesomeIcons.chevronDown,
                            width: 16.0,
                            height: 16.0,
                            fit: BoxFit.contain,
                          ),
                          rightIconColor: ColorX.black,
                          rightAction: () {},
                          controller: controller.txtRoleController,
                          dropdownList: const ['User', 'Admin'],
                          dropdownKeys: const ['User', 'Admin'],
                          dropdownSelected: (value) {
                            controller.txtRoleController.text = value;
                          }),
                    ],
                  ),
                ),
                ContainerX(
                  padding: const EdgeInsets.only(
                      left: 24.0, top: 8.0, right: 24.0, bottom: 8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        ButtonX(
                          width: 150.0,
                          height: 32.0,
                          title: 'Forgot Password?',
                          titleColor: ColorX.black,
                          fontSize: 14.0,
                          backgroundColor: ColorX.transparent,
                          onClicked: () {
                            controller.btnForgotPasswordClicked();
                          },
                        ),
                        SizedBox(height: 16.0),
                        ButtonX(
                          title: 'Sign In',
                          backgroundColor: ColorX.green,
                          onClicked: () {
                            controller.btnSignInClicked();
                          },
                        )
                      ]),
                )
              ],
            )))));
  }
}
