import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'container_x.dart';
import 'image_x.dart';
import 'text_x.dart';

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
  final String? rightIcon;
  final Color? rightIconColor;
  final GestureTapCallback? rightAction;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final List<String>? dropdownList;
  final List<String>? dropdownKeys;
  final Function(String key)? dropdownSelected;
  final Function(String value)? onChanged;

  const TextFieldX({
    Key? key,
    required this.hint,
    required this.obscureText,
    required this.cornerRadius,
    required this.borderWidth,
    required this.borderColor,
    required this.height,
    required this.keyboardType,
    required this.multiline,
    required this.readOnly,
    this.rightIcon,
    this.rightIconColor,
    this.rightAction,
    this.controller,
    this.focusNode,
    this.dropdownList,
    this.dropdownKeys,
    this.dropdownSelected,
    this.onChanged,
  }) : super(key: key);

  PopupMenuItem popupItemView(
      {required String title, required Color color, required String value}) {
    return PopupMenuItem(
      value: value,
      child: TextX(
        title,
        color: color,
        fontSize: 14.0,
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
        color: Colors.transparent,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(cornerRadius - (borderWidth * 2)),
              bottomRight: Radius.circular(cornerRadius - (borderWidth * 2))),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
          ),
          child: InkWell(
            onTap: () => rightAction != null ? rightAction!() : null,
            child: ImageX(
              url: (rightIcon != null && rightIcon!.isNotEmpty)
                  ? rightIcon!
                  : '',
              width: double.infinity,
              height: double.infinity,
              color: (rightIcon != null && rightIcon!.isNotEmpty)
                  ? rightIconColor!
                  : Colors.transparent,
              fit: BoxFit.contain,
              padding: const EdgeInsets.all(8.0),
            ),
          ),
        ),
      ),
    );
  }

  Widget rightContainerDropdown(BuildContext context) {
    return Material(
        color: Colors.transparent,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(cornerRadius - (borderWidth * 2)),
              bottomRight: Radius.circular(cornerRadius - (borderWidth * 2))),
        ),
        child: Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
            ),
            child: PopupMenuButton(
              tooltip: '',
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(cornerRadius))),
              child: ContainerX(
                width: 38.0 - (borderWidth * 1),
                height: height - (borderWidth * 2),
                child: ImageX(
                  url: (rightIcon != null && rightIcon!.isNotEmpty)
                      ? rightIcon!
                      : '',
                  width: double.infinity,
                  height: double.infinity,
                  color: (rightIcon != null && rightIcon!.isNotEmpty)
                      ? rightIconColor!
                      : Colors.transparent,
                  fit: BoxFit.contain,
                  padding: const EdgeInsets.all(8.0),
                ),
              ),
              onSelected: (value) {
                dropdownSelected != null
                    ? dropdownSelected!(value.toString())
                    : null;
              },
              itemBuilder: (BuildContext context) {
                return dropdownList!.mapIndexed((index, item) {
                  return popupItemView(
                      title: item,
                      color: const Color(0xff0A0A0A),
                      value: dropdownKeys![index]);
                }).toList();
              },
            )));
  }

  @override
  Widget build(BuildContext context) {
    return ContainerX(
        backgroundColor: (rightIcon != null && rightIcon!.isNotEmpty)
            ? Colors.white
            : readOnly == false
                ? Colors.white
                : const Color(0xffF4F4F4),
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
              style: const TextStyle(fontSize: 16.0, color: Color(0xff434343)),
              keyboardType: multiline ? TextInputType.multiline : keyboardType,
              textInputAction:
                  multiline ? TextInputAction.newline : TextInputAction.done,
              maxLines: obscureText
                  ? 1
                  : multiline
                      ? 8
                      : null,
              readOnly: readOnly,
              decoration: InputDecoration(
                isDense: true,
                border: InputBorder.none,
                hintText: hint,
                hintStyle:
                    const TextStyle(fontSize: 16.0, color: Color(0xffcccccc)),
              ),
            ),
          ),
          Visibility(
            visible:
                (rightIcon != null && rightIcon!.isNotEmpty) ? true : false,
            child: const SizedBox(width: 4.0),
          ),
          Visibility(
            visible:
                (rightIcon != null && rightIcon!.isNotEmpty) ? true : false,
            child: (dropdownList != null && dropdownList!.isNotEmpty)
                ? rightContainerDropdown(context)
                : rightContainerButton(context),
          ),
        ]));
  }
}
