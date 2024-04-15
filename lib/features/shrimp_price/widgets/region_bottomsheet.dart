import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jala/controllers/shrimp_price_controller.dart';
import 'package:jala/shared/widgets/text_field.dart';
import 'package:jala/shared/colors.dart';
import 'package:jala/shared/text_styles.dart';
import 'package:jala/shared/utils.dart';
import 'package:jala/shared/widgets/paginated_listview.dart';
import 'package:sizer/sizer.dart';
import 'package:skeletonizer/skeletonizer.dart';

class RegionBottomsheet extends GetView<ShrimpPriceController> {
  final Function(String region, String regionId) onPressed;
  final String currentRegion;

  const RegionBottomsheet({
    super.key,
    required this.onPressed,
    required this.currentRegion,
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
                'Kota/Kabupaten',
                style: textBlack(fontSize: 16, weight: FontWeight.w700),
              ),
              const Spacer(),
              InkWell(
                onTap: () => Get.back(),
                child: Text(
                  'Tutup',
                  style: textPrimary(weight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 1.h),
        Padding(
          padding: EdgeInsets.only(bottom: 1.h),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 4.w),
                  child: CustomTextField(
                    controller: controller.regionSearchCtr,
                    hint: 'Cari',
                    leading: const Icon(
                      Icons.search,
                      color: grayColor,
                    ),
                    onTextChanged: (text) {
                      controller.isShowRegionClear(text.isNotEmpty);
                    },
                    onSubmitted: (text) {
                      controller.fetchRegions(isFilter: true);
                    },
                  ),
                ),
              ),
              Obx(
                () => Visibility(
                  visible: controller.isShowRegionClear.value,
                  child: Padding(
                    padding: EdgeInsets.only(left: 4.w),
                    child: InkWell(
                      onTap: () {
                        controller.regionSearchCtr.clear();
                      },
                      child: Image.asset(
                        getImageAsset(assetName: 'clear.png'),
                        width: 4.w,
                        height: 2.h,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 4.w)
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 1,
          color: underlineColor,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height - 23.h,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 2.h),
            child: Obx(
              () => PaginatedListview(
                isLoading: controller.isRegionLoading.value,
                onReachLastItem: () {
                  controller.fetchRegions();
                },
                itemBuilder: (context, index) {
                  final region = controller.regions[index];
                  final name = region
                      .getFullAddress()
                      .split(' ')
                      .map((e) => e.capitalizeFirst)
                      .join(' ');

                  return Skeletonizer(
                    enabled: controller.isRegionLoading.value,
                    child: InkWell(
                      onTap: () => onPressed(name, region.id),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: Row(
                          children: [
                            Text(
                              name,
                              style: textBlack(),
                            ),
                            const Spacer(),
                            Visibility(
                              visible: currentRegion == name,
                              child: const Icon(
                                Icons.check_circle_outline,
                                color: primaryColor,
                                size: 16,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separator: SizedBox(
                  height: 3.h,
                ),
                itemCount: controller.regions.length,
              ),
            ),
          ),
        )
      ],
    );
  }
}
