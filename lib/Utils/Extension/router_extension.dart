import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension RouterExtension on BuildContext {
  void clearAndGo(String path) {
    while (canPop() == true) {
      pop();
    }
    go(path);
  }
}
