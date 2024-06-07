// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:tikichat_app/Utils/Theme/index.dart';

class TitleTextWidget extends StatelessWidget {
  const TitleTextWidget({
    super.key,
    required this.titleText,
  });

  final String titleText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          titleText,
          style:
              context.textStyle.h15Bold.copyWith(color: context.colors.black),
        ),
      ],
    );
  }
}