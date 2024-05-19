import 'package:flutter/material.dart';
import 'package:tikichat_app/Presentation/View/Components/tk_layout.dart';
import 'package:tikichat_app/Presentation/View/Components/tk_text.dart';
import 'package:tikichat_app/Utils/Theme/index.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TkLayout(child: Center(child: TkText(text: "홈", style: context.textStyle.h30Bold)));
  }
}
