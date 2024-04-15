import 'package:flutter/material.dart';
import 'package:jala/shared/colors.dart';
import 'package:jala/shared/text_styles.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final Function() onPressed;

  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(primaryColor),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
      child: Text(
        label,
        style: textWhite(weight: FontWeight.w700),
      ),
    );
  }
}
