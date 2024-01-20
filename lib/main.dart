import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'utils/reachability_x.dart';
import 'viewmodels/demo_preferences_vm.dart';
import 'viewmodels/demo_session_vm.dart';
import 'views/demo_screen/demo_screen.dart';
import 'widgets/all_widgets.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var firstInstall = await DemoPreferencesVM.getFirstInstall();
  if (firstInstall == true) {
    await DemoPreferencesVM.deleteAll();
    await DemoPreferencesVM.setFirstInstall(false);
  }

  await DemoSessionVM.load();

  Widget firstScreen;

  /*
  if (firstInstall == true) {
    firstScreen = DemoOnboardingScreen();
  } else {
    if (DemoSessionVM.token.isNotEmpty) {
      if (biometricEnabled == true) {
        firstScreen = DemoLoginScreen();
      } else {
        firstScreen = DemoTabbarScreen();
      }
    } else {
      firstScreen = DemoLoginScreen();
    }
  } */

  firstScreen = DemoScreen();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {
    runApp(
      ContainerX(
        backgroundColor: Color(0xff22303c),
        child: Center(
          child: Container(
            width: kIsWeb ? 400.0 : double.infinity,
            child: MyApp(firstScreen),
          ),
        ),
      ),
    );
  });

  ReachabilityX.startListening(handler: (connected) {
    if (connected == true) {
      ToastX.snackBarCustom(
        widget: InternetOfflineToast(),
        duration: 3500,
      );
    } else {
      ToastX.snackBarCustom(
        widget: InternetOnlineToast(),
        duration: 0,
      );
    }
  });

/*
  if (DemoSessionVM.token.isNotEmpty) {
    DemoSessionVM.checkPinAndBiometric();
  } */
}

class MyApp extends StatelessWidget {
  final Widget firstScreen;
  MyApp(this.firstScreen);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      popGesture: true,
      defaultTransition: Transition.cupertino,
      debugShowCheckedModeBanner: false,
      locale: Get.deviceLocale, //for setting localization strings
      fallbackLocale: Locale('en', 'US'),
      scrollBehavior: AppScrollBehavior(),
      title: 'DemoFlutter',
      home: firstScreen,
      theme: ThemeData(
          visualDensity: VisualDensity.standard,
          primarySwatch: Colors.grey,
          fontFamily: 'Roboto',
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          })),
    );
  }
}

void forceQuit() {
  if (Platform.isAndroid) {
    SystemNavigator.pop();
  } else if (Platform.isIOS) {
    exit(0);
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}
