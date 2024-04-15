import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:jala/controllers/shrimp_price_detail_controller.dart';
import 'package:jala/features/shrimp_price_detail/widgets/detail_header.dart';
import 'package:jala/shared/text_styles.dart';
import 'package:jala/shared/utils.dart';
import 'package:sizer/sizer.dart';

class DetailBody extends GetView<ShrimpPriceDetailController> {
  DetailBody({super.key});

  final steps = List.generate(19, (index) => ((index + 1) * 10) + 10);

  @override
  Widget build(BuildContext context) {
    final data = controller.detail.value?.data;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DetailHeader(data: data),
          SizedBox(height: 2.h),
          Text(
            'Daftar Harga',
            style: textBlack(fontSize: 16, weight: FontWeight.w700),
          ),
          SizedBox(height: 1.5.h),
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final json = data?.toJson();
                final stepPrice = json?['size_${steps[index]}'];

                return Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Size ${steps[index]}',
                        style: textBlack(fontSize: 16),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        stepPrice != null
                            ? formatCurrency(
                                amount: stepPrice.toDouble(), symbol: 'Rp')
                            : '-',
                        style: textBlack(fontSize: 16),
                      ),
                    )
                  ],
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 1.25.h),
              itemCount: steps.length),
          SizedBox(height: 2.25.h),
          Text(
            'Catatan',
            style: textBlack(fontSize: 16, weight: FontWeight.w700),
          ),
          SizedBox(height: .5.h),
          Text(data?.remark ?? '-')
        ],
      ),
    );
  }
}
