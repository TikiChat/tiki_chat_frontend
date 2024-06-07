// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:tikichat_app/Utils/Extension/size_extension.dart';
import 'package:tikichat_app/Utils/Theme/index.dart';

class SelectButtonWidget extends StatelessWidget {
  const SelectButtonWidget({
    super.key,
    required this.index,
    required this.selectedIndex,
    required this.contentText,
    required this.updateSelectedIndex,
  });
  final int index;
  final int selectedIndex;
  final String contentText;
  final void Function(int) updateSelectedIndex;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => updateSelectedIndex(index),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.px, vertical: 7.px),
        margin: EdgeInsets.only(right: 14.px, bottom: 14.px),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(27.px),
            border: Border.all(
              color: index == selectedIndex
                  ? context.colors.selectedButton
                  : context.colors.unSelectedButton,
              style: BorderStyle.solid,
              width: 1.px,
            )),
        child: Text(
          contentText,
          style: context.textStyle.h12Bold.copyWith(
              color: index == selectedIndex
                  ? context.colors.selectedButton
                  : context.colors.unSelectedButton),
        ),
      ),
    );
  }
}