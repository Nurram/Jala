import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jala/controllers/shrimp_price_controller.dart';
import 'package:jala/features/shrimp_price/widgets/region_bottomsheet.dart';
import 'package:jala/features/shrimp_price/widgets/size_bottomsheet.dart';
import 'package:jala/shared/colors.dart';
import 'package:jala/shared/text_styles.dart';
import 'package:jala/shared/utils.dart';
import 'package:sizer/sizer.dart';

class FloatingButton extends GetView<ShrimpPriceController> {
  const FloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: InkWell(
              onTap: _showSizeBotomsheet,
              child: Container(
                height: 5.5.h,
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                decoration: const BoxDecoration(
                  color: primaryDarkColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    bottomLeft: Radius.circular(60),
                  ),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      getImageAsset(assetName: 'filter.png'),
                    ),
                    SizedBox(width: 2.w),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Size',
                          style: textWhite(fontSize: 12),
                        ),
                        Obx(
                          () => Text(
                            controller.currentSize.value.toString(),
                            style: textWhite(weight: FontWeight.w700),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: InkWell(
              onTap: _showRegionBottomsheet,
              child: Container(
                height: 5.5.h,
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                decoration: const BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(60),
                    bottomRight: Radius.circular(60),
                  ),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      getImageAsset(assetName: 'location.png'),
                    ),
                    SizedBox(width: 2.w),
                    Obx(
                      () => Text(
                        controller.getRegion(),
                        style: textWhite(weight: FontWeight.w700, fontSize: 16),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _bottomSheet({required Widget child}) {
    showModalBottomSheet(
      context: Get.context!,
      isScrollControlled: true,
      backgroundColor: whiteColor,
      barrierColor: primaryDarkColor.withAlpha(204),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      builder: (context) => child,
    );
  }

  _showSizeBotomsheet() {
    _bottomSheet(
      child: SizeBottomsheet(
        currentStep: controller.currentSize.value,
        onPressed: (step) {
          controller.currentSize(step);
          Get.back();
        },
      ),
    );
  }

  _showRegionBottomsheet() {
    _bottomSheet(
      child: RegionBottomsheet(
          onPressed: (region, regionId) {
            controller.currentRegion(region);
            controller.currentRegionId(regionId);
            controller.fetchPrices(isFilter: true);

            Get.back();
          },
          currentRegion: controller.currentRegion.value),
    );
  }
}
