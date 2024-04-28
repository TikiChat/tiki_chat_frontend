import 'package:flutter/material.dart';
import 'package:tikichat_app/Utils/Theme/index.dart';

class TkLayout extends StatelessWidget {
  const TkLayout({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      body: SafeArea(child: child),
    );
  }
}
