import 'package:demoflutter/viewmodels/demo_reachability_vm.dart';
import 'viewmodels/demo_anti_jailbreak_vm.dart';
import 'viewmodels/demo_preferences_vm.dart';
import 'viewmodels/demo_session_vm.dart';
import 'views/demo_screen/demo_screen.dart';
import 'widgets/all_widgets.dart';

var jailbroken = false;
var developerMode = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DemoAntiJailbreakVM.check();
  DemoReachabilityVM.startListening();

  var firstInstall = await DemoPreferencesVM.getFreshInstall();
  if (firstInstall == true) {
    await DemoPreferencesVM.deleteAll();
    await DemoPreferencesVM.setFreshInstall(false);
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
/*
  if (DemoSessionVM.token.isNotEmpty) {
    DemoSessionVM.checkPinAndBiometric();
  } */
}

class MyApp extends StatelessWidget {
  final Widget firstScreen;
  MyApp(this.firstScreen);

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
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
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
