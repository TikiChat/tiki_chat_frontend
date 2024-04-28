import 'package:flutter/material.dart';
import 'package:tikichat_app/Presentation/View/Components/tk_text.dart';
import 'package:tikichat_app/Utils/Enum/common_enum.dart';
import 'package:tikichat_app/Utils/Extension/size_extension.dart';
import 'package:tikichat_app/Utils/Theme/index.dart';

class TkButton extends StatelessWidget {
  const TkButton({
    super.key,
    required this.text,
    this.onPressed,
    this.padding,
    this.isLong,
    this.width,
    this.bgColor,
    this.textColor,
    required this.type,
  });
  final String text;
  final void Function()? onPressed;
  final EdgeInsets? padding;
  final bool? isLong;
  final double? width;
  final Color? bgColor;
  final Color? textColor;
  final ButtonEnum type;

  factory TkButton.radius({
    required String text,
    void Function()? onPressed,
    EdgeInsets? padding,
    bool? isLong,
    double? width,
    Color? bgColor,
    Color? textColor,
  }) {
    return TkButton(
      text: text,
      onPressed: onPressed,
      padding: padding,
      isLong: isLong,
      width: width,
      bgColor: bgColor,
      textColor: textColor,
      type: ButtonEnum.RADIUS,
    );
  }

  factory TkButton.outline({
    required String text,
    void Function()? onPressed,
    EdgeInsets? padding,
    bool? isLong,
    double? width,
    Color? bgColor,
    Color? textColor,
  }) {
    return TkButton(
      text: text,
      onPressed: onPressed,
      padding: padding,
      isLong: isLong,
      width: width,
      bgColor: bgColor,
      textColor: textColor,
      type: ButtonEnum.OUTLINE,
    );
  }

  Widget radiusButton(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        padding: MaterialStatePropertyAll(padding ?? EdgeInsets.all(10.px)),
        backgroundColor: bgColor != null
            ? MaterialStatePropertyAll(bgColor)
            : MaterialStatePropertyAll(context.colors.primary),
      ),
      child: TkText(
        text: text,
        style: context.textStyle.h2,
        color: textColor ?? context.colors.white,
      ),
    );
  }

  Widget outlineButton(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        padding: MaterialStatePropertyAll(padding ?? EdgeInsets.all(10.px)),
        backgroundColor: bgColor != null
            ? MaterialStatePropertyAll(bgColor)
            : MaterialStatePropertyAll(context.colors.primary),
      ),
      child: TkText(
        text: text,
        style: context.textStyle.h2,
        color: textColor ?? context.colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget child;

    switch (type) {
      case ButtonEnum.RADIUS:
        child = radiusButton(context);
      case ButtonEnum.OUTLINE:
        child = outlineButton(context);
      default:
        child = radiusButton(context);
    }

    return SizedBox(
      width: isLong == true ? double.infinity : width,
      child: child,
    );
  }
}
