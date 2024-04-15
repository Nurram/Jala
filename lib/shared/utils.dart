import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

String getImageAsset({required String assetName}) => 'assets/images/$assetName';

String formatDate({
  required String pattern,
  required DateTime date,
}) =>
    DateFormat(pattern).format(date);

String formatCurrency({required double amount, required String symbol}) =>
    NumberFormat.currency(
      locale: 'id',
      symbol: '$symbol ',
      decimalDigits: 0,
    ).format(amount);

showSnackbar({required String message, required bool isSuccess}) {
  // if (message.contains('subtype')) return;

  ScaffoldMessenger.of(Get.context!).showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}
