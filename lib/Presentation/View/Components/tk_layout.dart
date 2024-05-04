import 'package:flutter/material.dart';
import 'package:tikichat_app/Utils/Extension/size_extension.dart';
import 'package:tikichat_app/Utils/Theme/index.dart';

class TkLayout extends StatelessWidget {
  const TkLayout({super.key, required this.child, this.padding});
  final Widget child;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: context.colors.background,
      body: SafeArea(
          child: Padding(
        padding: padding ?? EdgeInsets.symmetric(horizontal: 25.px),
        child: child,
      )),
    );
  }
}
