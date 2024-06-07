// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tikichat_app/Presentation/View/chat/CreateChatWidgets/title_text_widget.dart';
import 'package:tikichat_app/Utils/Enum/common_enum.dart';
import 'package:tikichat_app/Utils/Extension/size_extension.dart';
import 'package:tikichat_app/Utils/Theme/index.dart';

class TitleTextFieldWidget extends StatefulWidget {
  const TitleTextFieldWidget({
    super.key,
    this.validator,
    required this.titleText,
    this.hintText,
    this.underText,
    this.isShowCount,
    this.maxLength,
    this.isOptional,
    this.submittedEvent,
    required this.controller,
  });
  final InputValidateEnum? validator;
  final String titleText;
  final String? hintText;
  final String? underText;
  final bool? isShowCount;
  final int? maxLength;
  final bool? isOptional;
  final void Function(String)? submittedEvent;
  final TextEditingController controller;

  @override
  State<TitleTextFieldWidget> createState() => _TitleTextFieldWidgetState();
}

class _TitleTextFieldWidgetState extends State<TitleTextFieldWidget> {
  var textLength = 0;
  var contentText = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.px),
      borderSide: BorderSide(
        color: context.colors.inputBorder,
      ),
    );
    return Column(
      children: [
        Row(
          children: [
            TitleTextWidget(titleText: widget.titleText),
            if (widget.isOptional ?? false) Gap(4.px),
            if (widget.isOptional ?? false)
              Text(
                "선택",
                style: context.textStyle.h11Bold
                    .copyWith(color: context.colors.hintText),
              ),
          ],
        ),
        Gap(17.px),
        TextFormField(
          controller: widget.controller,
          style: context.textStyle.h15Medium,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          maxLength: widget.maxLength,
          onChanged: (value) {
            setState(() {
              textLength = value.length;
              contentText = value;
            });
          },
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 14.px, vertical: 15.px),
            hintStyle: context.textStyle.h15Medium
                .copyWith(color: context.colors.hintText),
            border: InputBorder.none,
            hintText: widget.hintText ?? '',
            enabledBorder: outlineInputBorder,
            focusedBorder: outlineInputBorder,
            counterText: '',
          ),
          textInputAction: TextInputAction.done,
          onFieldSubmitted: (_) {
            widget.submittedEvent!(contentText);
          },
        ),
        Gap(8.px),
        Container(
          alignment: (widget.isShowCount ?? false)
              ? Alignment.centerRight
              : Alignment.centerLeft,
          child: Text(
            (widget.isShowCount ?? false)
                ? '$textLength/${widget.maxLength}'
                : widget.underText ?? '',
            style: context.textStyle.h12Regular
                .copyWith(color: context.colors.hintText),
          ),
        ),
      ],
    );
  }
}