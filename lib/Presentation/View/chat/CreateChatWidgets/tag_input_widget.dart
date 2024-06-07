// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:tikichat_app/Presentation/View/chat/CreateChatWidgets/tag_item_widget.dart';
import 'package:tikichat_app/Presentation/View/chat/CreateChatWidgets/title_text_field_widget.dart';
import 'package:tikichat_app/Utils/Extension/size_extension.dart';

class TagInputWidget extends StatefulWidget {
  const TagInputWidget({super.key});

  @override
  State<TagInputWidget> createState() => _TagInputWidgetState();
}

class _TagInputWidgetState extends State<TagInputWidget> {
  List<String> tagList = [];
  late FToast fToast;

  showCustomToast() {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.green,
      ),
      child: const Text("태그는 10개까지 추가할 수 있습니다."),
    );

    fToast.showToast(
      child: toast,
      toastDuration: const Duration(seconds: 3),
    );
  }

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleTextFieldWidget(
          controller: TextEditingController(),
          titleText: '채팅 태그 설정하기',
          hintText: '태그를 설정해 보세요.',
          maxLength: 20,
          isOptional: true,
          underText: '1개의 태그당 20자 이하로, 10개의 태그를 설정할 수 있습니다.',
          submittedEvent: addTag,
        ),
        Gap(17.px),
        SizedBox(
          height: 100.px,
          child: ListView.builder(
            itemCount: tagList.length,
            itemBuilder: (context, index) {
              return TagItemWidget(
                content: tagList[index],
                deleteTag: deleteTag,
                itemIndex: index,
              );
            },
          ),
        ),
      ],
    );
  }

  void addTag(String tag) {
    setState(() {
      if (tagList.length > 10) {
        showCustomToast();
        return;
      }
      tagList.add(tag);
    });
  }

  void deleteTag(int index) {
    setState(() {
      tagList.removeAt(index);
    });
  }
}