import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/button_x.dart';
import '../../widgets/container_x.dart';
import '../../widgets/image_x.dart';
import '../../widgets/screen_x.dart';
import '../../widgets/text_button_x.dart';
import '../../widgets/text_x.dart';
import '../../widgets/textfield_x.dart';
import 'demo_login_controller.dart';

class DemoLoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DemoLoginController>(
        init: DemoLoginController(),
        builder: (controller) => ScreenX(
            lightStatusBar: false,
            bottomPadding: false,
            bodyView: Scrollbar(
                child: SingleChildScrollView(
                    child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const ImageX(
                    url: 'lib/images/ic_appx_logo.png',
                    width: 128.0,
                    height: 128.0,
                  ),
                ),
                const SizedBox(
                  height: 4.0,
                ),
                ContainerX(
                  padding: const EdgeInsets.only(
                      left: 24.0, top: 8.0, right: 24.0, bottom: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TextX(
                        'Username',
                        color: Color(0xff343a40),
                        fontSize: 13.0,
                        fontWeight: FontWeight.normal,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                      ),
                      const SizedBox(height: 4.0),
                      TextFieldX(
                        hint: 'Type your username',
                        obscureText: false,
                        cornerRadius: 8.0,
                        borderWidth: 1.0,
                        borderColor: const Color(0xffcfcfcf),
                        height: 42.0,
                        keyboardType: TextInputType.text,
                        multiline: false,
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
                      const TextX(
                        'Password',
                        color: Color(0xff343a40),
                        fontSize: 13.0,
                        fontWeight: FontWeight.normal,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                      ),
                      const SizedBox(height: 4.0),
                      TextFieldX(
                        hint: 'Type your password',
                        obscureText: controller.securedPassword,
                        cornerRadius: 8.0,
                        borderWidth: 1.0,
                        borderColor: const Color(0xffcfcfcf),
                        height: 42.0,
                        keyboardType: TextInputType.text,
                        multiline: false,
                        readOnly: false,
                        rightIcon: controller.securedPassword
                            ? 'lib/images/ic_appx_eye_closed.png'
                            : 'lib/images/ic_appx_eye_open.png',
                        rightIconColor: controller.securedPassword
                            ? Colors.grey
                            : const Color(0xff343a40),
                        rightAction: () {},
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
                      const TextX(
                        'Role',
                        color: Color(0xff343a40),
                        fontSize: 13.0,
                        fontWeight: FontWeight.normal,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                      ),
                      const SizedBox(height: 4.0),
                      TextFieldX(
                          hint: 'Select your role...',
                          obscureText: false,
                          cornerRadius: 8.0,
                          borderWidth: 1.0,
                          borderColor: const Color(0xffcfcfcf),
                          height: 42.0,
                          keyboardType: TextInputType.text,
                          multiline: false,
                          readOnly: true,
                          rightIcon: 'lib/images/ic_bio_chevron.png',
                          rightIconColor: const Color(0xff343a40),
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
                        TextButtonX(
                            title: 'Forgot Password?', onClicked: () {}),
                        ButtonX(
                          title: 'Sign In',
                          backgroundColor: Colors.green,
                          onClicked: () {
                            Get.back();
                          },
                        )
                      ]),
                )
              ],
            )))));
  }
}
