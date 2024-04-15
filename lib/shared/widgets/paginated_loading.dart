import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class PaginatedLoading extends StatelessWidget {
  final RxBool isLoading;
  final EdgeInsetsGeometry? margin;
  const PaginatedLoading({
    super.key,
    required this.isLoading,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(
        () => Visibility(
          visible: isLoading.value,
          child: Container(
            width: 3.w,
            height: 1.5.h,
            margin: margin ?? EdgeInsets.symmetric(vertical: 1.h),
            child: const CircularProgressIndicator.adaptive(
              strokeWidth: 2,
            ),
          ),
        ),
      ),
    );
  }
}
