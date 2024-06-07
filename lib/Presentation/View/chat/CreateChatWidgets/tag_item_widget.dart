// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:tikichat_app/Utils/Extension/size_extension.dart';
import 'package:tikichat_app/Utils/Theme/index.dart';

class TagItemWidget extends StatelessWidget {
  const TagItemWidget(
      {super.key,
      required this.content,
      required this.deleteTag,
      required this.itemIndex});
  final String content;
  final void Function(int) deleteTag;
  final int itemIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(7.px),
          margin: EdgeInsets.only(bottom: 5.px),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.px),
            border: null,
            color: context.colors.tagBackground,
          ),
          child: GestureDetector(
            onTap: () {
              deleteTag(itemIndex);
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '#$content',
                  style: context.textStyle.h12Bold.copyWith(
                    color: context.colors.tagText,
                  ),
                ),
                Gap(10.px),
                Text(
                  'x',
                  style: context.textStyle.h12Bold.copyWith(
                    color: context.colors.tagText,
                  ),
                ),
                // IconButton(
                //   icon: Icon(
                //     CupertinoIcons.xmark,
                //     size: 13.px,
                //   ),
                //   onPressed: () {},
                // ),
              ],
            ),
          ),
        ),
        Expanded(child: Container()),
      ],
    );
  }
}