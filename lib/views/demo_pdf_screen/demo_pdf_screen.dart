import 'package:flutter_pdfview/flutter_pdfview.dart';
import '../../widgets/all_widgets.dart';
import 'demo_pdf_controller.dart';

class DemoPdfScreen extends StatelessWidget {
  DemoPdfScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DemoPdfController>(
        init: DemoPdfController(),
        builder: (controller) => ScreenX(
              lightStatusBar: true,
              headerView: NavigationBarX(
                title: 'PDF',
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
              bodyView: PDFView(
                filePath: controller.pathPDF,
                autoSpacing: true,
                enableSwipe: true,
                pageSnap: true,
                swipeHorizontal: true,
                onRender: (_pages) {
                  controller.update();
                },
                onError: (error) {
                  print(error);
                },
                onPageError: (page, error) {
                  print('$page: ${error.toString()}');
                },
                onViewCreated: (PDFViewController vc) {
                  controller.pdfViewController = vc;
                  //controller.update();
                },
              ),
            ));
  }
}
