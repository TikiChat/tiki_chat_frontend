import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tikichat_app/Presentation/View/Components/tk_text.dart';
import 'package:tikichat_app/Utils/Extension/size_extension.dart';
import 'package:tikichat_app/Utils/Theme/index.dart';

class chat_list_item_widget extends StatelessWidget {
  const chat_list_item_widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 28.px),
      child: Row(
        children: [
          Stack(
            children: <Widget>[
              Row(
                children: [
                  CircleAvatar(
                    radius: 30.px, // Image radius
                    backgroundImage: const NetworkImage(
                        'https://i.ibb.co/CwzHq4z/trans-logo-512.png'),
                  ),
                  Gap(2.px)
                ],
              ),
              Positioned(
                  right: 0,
                  bottom: 10.px,
                  child: Image.asset('assets/images/icon_crown.png')),
            ],
          ),
          Gap(11.px),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: TkText(
                                  text:
                                      "바퀴벌레 어떻게 잡아야하나요asjhdhakdhasjdhaksjkdhakdhakdhaksdhajksdhasjdhjkdakdkasjdahjk",
                                  style: context.textStyle.h15Bold,
                                  maxLine: 1,
                                ),
                              ),
                              Icon(
                                Icons.volume_off,
                                color: Colors.grey,
                                size: 20.px,
                              ),
                            ],
                          ),
                          Gap(6.px),
                          TkText(
                            text: "바퀴벌레 어떻게 잡아야하나요",
                            style: context.textStyle.h12Regular,
                            color: context.colors.subTitleText,
                            maxLine: 1,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      child: SizedBox(
                        width: 49.px,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TkText(
                              text: "어제",
                              style: context.textStyle.h12Regular,
                              color: context.colors.subTitleText,
                            ),
                            Gap(10.px),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 4.0.px, horizontal: 8.px),
                              decoration: BoxDecoration(
                                color: context.colors.primary,
                                borderRadius: BorderRadius.circular(27.px),
                              ),
                              child: TkText(
                                text: "10",
                                style: context.textStyle.h12Regular,
                                color: context.colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Gap(6.px),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
