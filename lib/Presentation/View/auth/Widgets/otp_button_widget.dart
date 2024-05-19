import 'package:flutter/material.dart';
import 'package:tikichat_app/Utils/Theme/index.dart';

class OtpButtonWidget extends StatefulWidget {
  const OtpButtonWidget({super.key, required this.controller, this.focus, this.nextFocus});
  final TextEditingController controller;
  final FocusNode? focus;
  final FocusNode? nextFocus;

  @override
  State<OtpButtonWidget> createState() => _OtpButtonWidgetState();
}

class _OtpButtonWidgetState extends State<OtpButtonWidget> {
  late bool filled;
  @override
  void initState() {
    super.initState();
    filled = false;
    widget.controller.addListener(() {
      setState(() {
        filled = widget.controller.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1,
        child: TextFormField(
          focusNode: widget.focus,
          controller: widget.controller,
          maxLength: 1,
          style: context.textStyle.h20Bold.copyWith(height: 1.2),
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            counterText: "",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: context.colors.primary),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: filled ? context.colors.primary : context.colors.lightGrey,
              ),
            ),
          ),
          onChanged: (value) {
            if (widget.nextFocus != null) {
              FocusScope.of(context).requestFocus(widget.nextFocus);
            }
          },
        ),
      ),
    );
  }
}
