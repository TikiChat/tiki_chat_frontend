import 'package:flutter/material.dart';
import 'package:tikichat_app/Utils/Theme/index.dart';

class TkText extends StatelessWidget {
  const TkText({
    super.key,
    required this.text,
    required this.style,
    this.maxLine,
    this.textAlign,
    this.color,
  });
  final String text;
  final TextStyle style;
  final int? maxLine;
  final TextAlign? textAlign;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(
        color: color ?? context.colors.black,
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: maxLine ?? 2,
      textAlign: textAlign,
    );
  }
}
