import 'package:flutter/material.dart';
import 'package:jala/shared/colors.dart';
import 'package:jala/shared/text_styles.dart';
import 'package:sizer/sizer.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final Widget? leading;
  final Function(String text)? onTextChanged;
  final Function(String text)? onSubmitted;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.leading,
    this.onTextChanged,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      decoration: BoxDecoration(
        color: textFieldColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: TextField(
        controller: controller,
        onChanged: onTextChanged,
        onSubmitted: onSubmitted,
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: leading,
          hintText: hint,
          hintStyle: textGray(fontSize: 16),
        ),
      ),
    );
  }
}
