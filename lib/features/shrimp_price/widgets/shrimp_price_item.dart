import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:jala/controllers/shrimp_price_controller.dart';
import 'package:jala/features/shrimp_price_detail/shrimp_price_detail_screen.dart';
import 'package:jala/models/shrimp_price_response.dart';
import 'package:jala/shared/colors.dart';
import 'package:jala/shared/text_styles.dart';
import 'package:jala/shared/utils.dart';
import 'package:jala/shared/widgets/cached_image.dart';
import 'package:jala/shared/widgets/primary_button.dart';
import 'package:sizer/sizer.dart';

import '../../../models/creator.dart';
import '../../../shared/widgets/verified_widget.dart';
import '../../shrimp_price_detail/shrimp_price_detail_binding.dart';

class ShrimpPriceItem extends GetView<ShrimpPriceController> {
  final PriceDatum priceDatum;

  const ShrimpPriceItem({
    super.key,
    required this.priceDatum,
  });

  @override
  Widget build(BuildContext context) {
    final creator = priceDatum.creator;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.5.h),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(1.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(creator: creator),
          SizedBox(height: 1.5.h),
          Text(
            formatDate(pattern: 'dd MMMM yyyy', date: priceDatum.date),
            style: textGrayish(fontSize: 12),
          ),
          SizedBox(height: 1.h),
          Text(
            (priceDatum.region.provinceName ?? '')
                .split(' ')
                .map((e) => e.capitalize)
                .join(' '),
            style: textBlack(fontSize: 12),
          ),
          SizedBox(height: 1.h),
          Text(
            (priceDatum.region.name ?? '')
                .split(' ')
                .map((e) => e.capitalize)
                .join(' '),
            style: textBlack(fontSize: 18, weight: FontWeight.w700),
          ),
          SizedBox(height: 1.h),
          _buildFooter(creator: creator),
        ],
      ),
    );
  }

  Widget _buildHeader({
    required Creator creator,
  }) =>
      Row(
        children: [
          CachedImage(
            url: '${dotenv.env['IMAGE_URL']}/${creator.avatar}',
          ),
          SizedBox(width: 2.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Supplier',
                style: textGrayish(fontSize: 12),
              ),
              Text(
                creator.name ?? '',
                style: textBlack(),
              ),
            ],
          ),
          const Spacer(),
          VerifiedWidget(creator: creator)
        ],
      );

  Widget _buildFooter({required Creator creator}) => Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => Text(
                  'Size: ${controller.currentSize}',
                  style: textGrayish(fontSize: 12),
                ),
              ),
              SizedBox(height: .5.h),
              Obx(
                () => Text(
                  formatCurrency(
                    amount: priceDatum
                        .getPriceBySize(
                          size: controller.currentSize.value,
                        )!
                        .toDouble(),
                    symbol: priceDatum.currencyId ?? 'IDR',
                  ),
                  style: textBlack(fontSize: 22, weight: FontWeight.w900),
                ),
              ),
            ],
          ),
          const Spacer(),
          PrimaryButton(
              label: 'LIHAT DETAIL',
              onPressed: () {
                Get.to(
                  () => const ShrimPriceDetailScreen(),
                  binding: ShrimpPriceDetailBinding(),
                  arguments: priceDatum.id
                );
              })
        ],
      );
}
