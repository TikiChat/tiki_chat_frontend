// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:tikichat_app/Presentation/View/chat/CreateChatWidgets/select_button_widget.dart';
import 'package:tikichat_app/Presentation/View/chat/CreateChatWidgets/title_text_widget.dart';
import 'package:tikichat_app/Utils/Extension/size_extension.dart';

class SelectWrapListWidget extends StatefulWidget {
  const SelectWrapListWidget(
      {super.key, required this.titleText, required this.items});

  final String titleText;
  final List<dynamic> items;

  @override
  State<SelectWrapListWidget> createState() => _SelectWrapListWidgetState();
}

class _SelectWrapListWidgetState extends State<SelectWrapListWidget> {
  late List<dynamic> items;
  int selectedIndex = -1;

  @override
  void initState() {
    super.initState();
    items = widget.items;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleTextWidget(
          titleText: widget.titleText,
        ),
        Gap(18.px),
        Wrap(
          children: List.generate(
            items.length,
            (i) => SelectButtonWidget(
              index: i,
              selectedIndex: selectedIndex,
              contentText: '${items[i]}',
              updateSelectedIndex: updateSelectedIndex,
            ),
          ).toList(),
        ),
      ],
    );
  }

  void updateSelectedIndex(int selectedIndex) {
    setState(() {
      this.selectedIndex = selectedIndex;
    });
  }
}