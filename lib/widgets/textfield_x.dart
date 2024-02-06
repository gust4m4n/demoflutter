import 'all_widgets.dart';

class TextFieldX extends StatelessWidget {
  final String hint;
  final bool obscureText;
  final double cornerRadius;
  final double borderWidth;
  final Color borderColor;
  final double height;
  final TextInputType keyboardType;
  final bool multiline;
  final bool readOnly;
  final ImageX? rightIcon;
  final Color? rightIconColor;
  final GestureTapCallback? rightAction;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Function(String value)? onChanged;

  const TextFieldX({
    Key? key,
    required this.hint,
    required this.obscureText,
    this.cornerRadius = 8.0,
    this.borderWidth = 1.0,
    this.borderColor = ColorX.lightGray,
    this.height = 48.0,
    required this.keyboardType,
    this.multiline = false,
    required this.readOnly,
    this.rightIcon,
    this.rightIconColor,
    this.rightAction,
    this.controller,
    this.focusNode,
    this.onChanged,
  }) : super(key: key);

  PopupMenuItem popupItemView(
      {required String title, required Color color, required String value}) {
    return PopupMenuItem(
      value: value,
      child: TextX(
        title,
        color: color,
        fontSize: 17.0,
        fontWeight: FontWeight.w500,
        textAlign: TextAlign.left,
        maxLines: 1,
      ),
    );
  }

  Widget rightContainerButton(BuildContext context) {
    return ContainerX(
      width: 38.0 - (borderWidth * 1),
      height: height - (borderWidth * 2),
      child: Material(
        color: ColorX.transparent,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(cornerRadius - (borderWidth * 2)),
              bottomRight: Radius.circular(cornerRadius - (borderWidth * 2))),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            splashColor: ColorX.transparent,
          ),
          child: InkWell(
            onTap: () => rightAction != null ? rightAction!() : null,
            child: rightIcon,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ContainerX(
        backgroundColor: (rightIcon != null)
            ? ColorX.white
            : readOnly == false
                ? ColorX.white
                : ColorX.gray,
        height: height,
        padding: EdgeInsets.only(
          left: borderWidth > 0.0 ? 12.0 : 0.0,
          top: 0.0,
          right: borderWidth > 0.0 ? ((rightIcon != null) ? 0.0 : 12.0) : 0.0,
          bottom: 0.0,
        ),
        borderWidth: borderWidth,
        borderColor: borderColor,
        cornerRadius: cornerRadius,
        child: Row(children: [
          Expanded(
            child: TextField(
              enabled: !this.readOnly,
              controller: controller,
              onChanged: onChanged,
              focusNode: focusNode,
              obscureText: obscureText,
              style: const TextStyle(fontSize: 17.0, color: ColorX.black),
              keyboardType: multiline ? TextInputType.multiline : keyboardType,
              textInputAction:
                  multiline ? TextInputAction.newline : TextInputAction.done,
              maxLines: obscureText
                  ? 1
                  : multiline
                      ? 8
                      : 1,
              readOnly: readOnly,
              decoration: InputDecoration(
                isDense: true,
                border: InputBorder.none,
                hintText: hint,
                hintStyle:
                    const TextStyle(fontSize: 17.0, color: ColorX.lightGray),
              ),
            ),
          ),
          Visibility(
            visible: (rightIcon != null) ? true : false,
            child: const SizedBox(width: 4.0),
          ),
          Visibility(
            visible: (rightIcon != null) ? true : false,
            child: rightContainerButton(context),
          ),
        ]));
  }
}
