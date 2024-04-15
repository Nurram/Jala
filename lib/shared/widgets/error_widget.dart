import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  final String errorMsg;
  final Function() onReload;

  const CustomErrorWidget({
    super.key,
    required this.errorMsg,
    required this.onReload,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [ ],
    );
  }
}
