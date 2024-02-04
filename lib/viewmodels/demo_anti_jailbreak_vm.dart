import 'dart:io';
import '../utils/all_utils.dart';
import '../widgets/all_widgets.dart';
import 'demo_session_vm.dart';

class DemoAntiJailbreakVM {
  static var jailbroken = false;
  static var developerMode = false;

  static check() async {
    if (!kIsWeb) {
      if (Platform.isAndroid || Platform.isIOS) {
        jailbroken = await FlutterJailbreakDetection.jailbroken;
        if (jailbroken == true) {
          block();
          return;
        }
        if (Platform.isAndroid) {
          developerMode = await FlutterJailbreakDetection.developerMode;
          if (developerMode == true) {
            if (kReleaseMode) {
              block();
              return;
            }
          }
        }
      }
    }
  }

  static block() {
    DemoSessionVM.forceQuit();
  }
}
