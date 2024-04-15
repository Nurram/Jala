import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jala/controllers/shrimp_price_controller.dart';
import 'package:jala/features/shrimp_price/widgets/alert_dialog.dart';
import 'package:jala/features/shrimp_price/widgets/shrimp_price_item_loading.dart';
import 'package:jala/shared/colors.dart';
import 'package:jala/shared/text_styles.dart';
import 'package:jala/shared/utils.dart';
import 'package:jala/features/shrimp_price/widgets/shrimp_price_item.dart';
import 'package:jala/features/shrimp_price/widgets/floating_button.dart';
import 'package:jala/shared/widgets/paginated_listview.dart';
import 'package:jala/shared/widgets/paginated_loading.dart';
import 'package:sizer/sizer.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ShrimpPriceWidget extends GetView<ShrimpPriceController> {
  const ShrimpPriceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Skeletonizer(
        enabled: controller.isLoading.value,
        child: Padding(
          padding: EdgeInsets.only(top: 2.h),
          child: RefreshIndicator.adaptive(
            onRefresh: () async {
              await controller.refreshDatas();
            },
            child: Stack(
              children: [
                PaginatedListview(
                  isLoading: controller.isLoading.value,
                  itemCount: 1,
                  separator: const SizedBox(),
                  onReachLastItem: () async {
                    await controller.fetchMorePrice();
                  },
                  itemBuilder: (context, index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          child: Text(
                            'Coba Fitur Lainnya',
                            style: textBlack(
                              fontSize: 12.sp,
                              weight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Container(
                          height: 13.h,
                          padding: EdgeInsets.only(left: 4.w),
                          child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => InkWell(
                              onTap: _showDialog,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  getImageAsset(
                                      assetName:
                                          index == 0 ? 'jali.png' : 'quiz.png'),
                                  fit: BoxFit.cover,
                                  width: 68.w,
                                  height: 13.h,
                                ),
                              ),
                            ),
                            separatorBuilder: (context, index) => SizedBox(
                              width: 4.w,
                            ),
                            itemCount: 2,
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: .25.h,
                          color: dividerColor,
                          margin: EdgeInsets.only(top: 2.h),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: 4.w, top: 2.h, bottom: 1.h),
                          child: Text(
                            'Harga Terbaru',
                            style: textPrimaryDark(
                                fontSize: 14.sp, weight: FontWeight.w700),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          child: ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 1.h),
                            itemCount: controller.isLoading.value
                                ? 10
                                : controller.shrimpPrices.length,
                            itemBuilder: (context, index) => controller
                                    .isLoading.value
                                ? const ShrimpPriceItemLoading()
                                : ShrimpPriceItem(
                                    priceDatum: controller.shrimpPrices[index],
                                  ),
                          ),
                        ),
                        PaginatedLoading(
                          isLoading: controller.isPaginateLoading,
                        )
                      ]),
                ),
                Visibility(
                  visible: !controller.isPaginateLoading.value,
                  child: const Align(
                    alignment: Alignment.bottomCenter,
                    child: FloatingButton(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _showDialog() {
    showDialog(
      context: Get.context!,
      builder: (context) => const CustomAlertDialog(),
    );
  }
}
