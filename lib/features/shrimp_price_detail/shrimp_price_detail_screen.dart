import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:jala/controllers/shrimp_price_detail_controller.dart';
import 'package:jala/features/shrimp_price_detail/widgets/detail_body.dart';
import 'package:jala/shared/text_styles.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sizer/sizer.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../shared/colors.dart';

class ShrimPriceDetailScreen extends GetView<ShrimpPriceDetailController> {
  const ShrimPriceDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: Text(
          'Harga Udang',
          style: textWhite(fontSize: 18),
        ),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              final data = controller.detail.value?.data;
              final message =
                  'Lihat harga udang terbaru oleh ${data?.creator?.name}\n'
                  '${dotenv.env['SHARE_URL']}/shrimp_prices/${data?.id}';

              Share.share(message);
            },
            icon: const Icon(Icons.share_outlined),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 1.5.h),
        child: Obx(
          () {
            final detail = controller.detail.value;
            final data = detail?.data;
            final region = data?.region;

            return Skeletonizer(
              enabled: controller.isLoading.value && detail == null,
              child: RefreshIndicator(
                onRefresh: () async {
                  await controller.fetchDetail();
                },
                child: ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      child: Text(
                        (region?.provinceName ?? '')
                            .split(' ')
                            .map((e) => e.capitalize)
                            .join(' '),
                        style: textBlack(fontSize: 16, weight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(height: .5.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      child: Text(
                        (region?.regencyName ?? '')
                            .split(' ')
                            .map((e) => e.capitalize)
                            .join(' '),
                        style: textUnselected(
                            fontSize: 16, weight: FontWeight.w700),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: .25.h,
                      color: dividerColor,
                      margin: EdgeInsets.only(top: 2.h, bottom: 1.h),
                    ),
                    DetailBody()
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
