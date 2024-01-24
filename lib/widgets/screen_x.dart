import 'all_widgets.dart';

class ScreenX extends StatelessWidget {
  final Key? scaffoldKey;
  final Widget? drawer;
  final Widget? headerView;
  final Widget? bodyView;
  final bool topPadding;
  final bool bottomPadding;
  final bool lightStatusBar;
  final bool loading;

  const ScreenX({
    Key? key,
    this.scaffoldKey,
    this.drawer,
    this.headerView,
    this.bodyView,
    this.topPadding = false,
    this.bottomPadding = false,
    required this.lightStatusBar,
    this.loading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (lightStatusBar == true) {
      StatusBarX.setLight();
    } else {
      StatusBarX.setDark();
    }
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: StatusBarX.theme,
        child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Scaffold(
                key: scaffoldKey,
                backgroundColor: Colors.white,
                drawer: drawer,
                body: Column(children: [
                  SizedBox(
                    height: topPadding
                        ? MediaQuery.of(Get.context!).padding.top
                        : 0.0,
                  ),
                  if (headerView != null) headerView!,
                  Expanded(
                      child: ContainerX(
                          height: double.infinity,
                          width: double.infinity,
                          clipBehavior: Clip.none,
                          child: loading
                              ? Center(
                                  child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          ColorX.gray)),
                                )
                              : bodyView ??
                                  ContainerX(
                                      backgroundColor: Colors.transparent))),
                  SizedBox(
                    height: bottomPadding
                        ? MediaQuery.of(Get.context!).padding.bottom
                        : 0.0,
                  ),
                ]))));
  }
}
