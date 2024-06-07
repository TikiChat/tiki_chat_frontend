// ignore_for_file: use_build_context_synchronously
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tikichat_app/Presentation/View/chat/CreateChatWidgets/select_wrap_list_widget.dart';
import 'package:tikichat_app/Presentation/View/chat/CreateChatWidgets/tag_input_widget.dart';
import 'package:tikichat_app/Presentation/View/chat/CreateChatWidgets/title_text_field_widget.dart';
import 'package:tikichat_app/Utils/Extension/size_extension.dart';
import 'package:tikichat_app/Utils/Theme/index.dart';

class CreateChatScreen extends StatelessWidget {
  const CreateChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const List<int> personCntDummyDataList = [
      12342,
      1233,
      5,
      10,
      20,
      30,
      50,
      100,
      200,
      300,
      400,
      500
    ]; //@Dummy

    const List<String> catDummyDataList = [
      '연애',
      '학업',
      '학업',
      '음료수',
      '학업',
      '밥밥디라',
      '음료수',
      '음료수',
      '음료수'
    ]; //@Dummy

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(CupertinoIcons.xmark),
          onPressed: () {},
        ),
        backgroundColor: context.colors.background,
        surfaceTintColor: Colors.transparent,
      ),
      backgroundColor: context.colors.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 32.px, vertical: 0.px),
                  child: Column(
                    children: [
                      TitleTextFieldWidget(
                        controller: TextEditingController(),
                        titleText: '채팅명',
                        hintText: '채팅명을 입력해주세요.',
                        maxLength: 30,
                        isShowCount: true,
                      ),
                      Gap(31.px),
                      const SelectWrapListWidget(
                        titleText: '인원',
                        items: personCntDummyDataList,
                      ),
                      Gap(41.px),
                      const SelectWrapListWidget(
                        titleText: '카테고리',
                        items: catDummyDataList,
                      ),
                      Gap(53.px),
                      const TagInputWidget(),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                print("#########################Tap 채팅방만들기###########");
              },
              child: Container(
                height: 56.px,
                margin: EdgeInsets.all(30.px),
                decoration: BoxDecoration(
                    color: context.colors.primary,
                    borderRadius: BorderRadius.circular(8.px)),
                child: Center(
                  child: Text(
                    '채팅방 만들기',
                    style: context.textStyle.h15.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}