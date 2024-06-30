import 'package:flutter/material.dart';
import 'package:tikichat_app/Presentation/View/Components/tk_layout.dart';
import 'package:tikichat_app/Presentation/View/chat/ChatListWidgets/chat_list_item_widget.dart';
import 'package:tikichat_app/Presentation/View/chat/ChatListWidgets/create_chat_button_widget.dart';
import 'package:tikichat_app/Utils/Extension/size_extension.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TkLayout(
      padding: EdgeInsets.symmetric(horizontal: 21.px),
      child: Stack(
        children: <Widget>[
          ListView.builder(
            itemCount: 30,
            itemBuilder: (context, index) {
              return chat_list_item_widget();
            },
          ),
          Positioned(
            right: 19.px,
            bottom: 18.px,
            child: create_chat_button_widget(),
          ),
        ],
      ),
    );
  }
}
