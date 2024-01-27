import 'dart:io';
import 'package:demoflutter/views/appx_bottom_navbar_screen/demo_bottom_navbar_screen.dart';
import 'package:flutter_jailbreak_detection/flutter_jailbreak_detection.dart';
import 'utils/reachability_x.dart';
import 'viewmodels/demo_preferences_vm.dart';
import 'viewmodels/demo_session_vm.dart';
import 'views/demo_screen/demo_screen.dart';
import 'widgets/all_widgets.dart';

var jailbroken = false;
var developerMode = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!kIsWeb) {
    if (Platform.isAndroid || Platform.isIOS) {
      jailbroken = await FlutterJailbreakDetection.jailbroken;
      if (jailbroken == true) {
        DemoSessionVM.forceQuit();
        return;
      }
      if (Platform.isAndroid) {
        developerMode = await FlutterJailbreakDetection.developerMode;
        if (developerMode == true) {
          if (kReleaseMode) {
            DemoSessionVM.forceQuit();
            return;
          }
        }
      }
    }
  }

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
        firstScreen = DemoBottomNavBarScreen();
      }
    } else {
      firstScreen = DemoLoginScreen();
    }
  } */

  firstScreen = DemoScreen();
//  firstScreen = DemoBottomNavBarScreen();

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

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}
