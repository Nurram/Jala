import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jala/controllers/shrimp_diseases_controller.dart';
import 'package:jala/features/shrimp_diseases/widgets/disease_item.dart';
import 'package:jala/features/shrimp_diseases/widgets/disease_item_loading.dart';
import 'package:jala/shared/text_styles.dart';
import 'package:sizer/sizer.dart';

import '../../shared/widgets/paginated_listview.dart';
import '../../shared/widgets/paginated_loading.dart';

class ShrimpDiseasesWidget extends GetView<ShrimpDiseasesController> {
  const ShrimpDiseasesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    controller.currentPage;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: EdgeInsets.only(left: 1.w),
          child: Text(
            'Daftar Penyakit',
            style: textPrimaryDark(fontSize: 18, weight: FontWeight.w700),
          ),
        ),
        SizedBox(height: 2.h),
        Expanded(
          child: RefreshIndicator.adaptive(
            onRefresh: () async {
              controller.currentPage(1);
              await controller.fetchDiseases(isPaginated: false);
            },
            child: Obx(
              () => PaginatedListview(
                isLoading: controller.isLoading.value,
                itemCount:
                    controller.isLoading.value ? 10 : controller.disease.length,
                itemBuilder: (context, index) => controller.isLoading.value
                    ? const DiseaseItemLoading()
                    : DiseaseItem(
                        disease: controller.disease[index],
                      ),
                separator: SizedBox(height: 1.5.h),
                onReachLastItem: () {
                  controller.fetchDiseases(isPaginated: true);
                },
              ),
            ),
          ),
        ),
        PaginatedLoading(
          isLoading: controller.isPaginateLoading,
          margin: EdgeInsets.only(top: 1.h),
        ),
      ]),
    );
  }
}
