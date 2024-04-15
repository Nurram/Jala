import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jala/shared/colors.dart';
import 'package:jala/shared/text_styles.dart';
import 'package:sizer/sizer.dart';

class SizeBottomsheet extends StatelessWidget {
  final Function(int step) onPressed;
  final int currentStep;

  final steps = List.generate(19, (index) => ((index + 1) * 10) + 10);

  SizeBottomsheet({
    super.key,
    required this.onPressed,
    required this.currentStep,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
          child: Row(
            children: [
              Text(
                'Size',
                style: textBlack(fontSize: 16, weight: FontWeight.w700),
              ),
              const Spacer(),
              InkWell(
                onTap: () => Get.back(),
                child: Text(
                  'Tutup',
                  style: textPrimary(weight: FontWeight.w700),
                ),
              )
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 1,
          color: underlineColor,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height - 17.h,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 2.h),
            child: ListView.separated(
                itemBuilder: (context, index) {
                  final step = steps[index];

                  return InkWell(
                    onTap: () => onPressed(step),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: Row(
                        children: [
                          Text(
                            step.toString(),
                            style: textBlack(),
                          ),
                          const Spacer(),
                          Visibility(
                            visible: currentStep == step,
                            child: const Icon(
                              Icons.check_circle_outline,
                              color: primaryColor,
                              size: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                      height: 3.h,
                    ),
                itemCount: steps.length),
          ),
        )
      ],
    );
  }
}
