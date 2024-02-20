import 'dart:async';
import 'dart:io';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';

import '../../widgets/all_widgets.dart';

class DemoPdfController extends GetxController {
  late PDFViewController pdfViewController;
  String pathPDF = "";

  @override
  void onReady() {
    super.onReady();
    update();

    fromAsset('lib/assets/pdf_example.pdf', 'pdf_example.pdf').then((f) {
      pathPDF = f.path;
      update();
    });
  }

  btnBackClicked() {
    Get.back();
  }

  Future<File> fromAsset(String asset, String filename) async {
    // To open from assets, you can copy them to the app storage folder, and the access them "locally"
    Completer<File> completer = Completer();

    try {
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$filename");
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }
    return completer.future;
  }
}
