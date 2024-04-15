import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jala/shared/text_styles.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: Text(
        'Perhatian!',
        style: textBlack(
          fontSize: 16,
          weight: FontWeight.bold,
        ),
      ),
      content: Text(
        'Coming Soon!',
        style: textBlack(),
      ),
      actions: [
        TextButton(
          onPressed: Get.back,
          child: Text(
            'Tutup',
            style: textPrimary(),
          ),
        )
      ],
    );
  }
}
