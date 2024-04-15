import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jala/controllers/shrimp_news_controller.dart';
import 'package:jala/features/shrimp_news/widgets/news_item.dart';
import 'package:jala/features/shrimp_news/widgets/news_item_loading.dart';
import 'package:jala/shared/text_styles.dart';
import 'package:jala/shared/widgets/paginated_listview.dart';
import 'package:jala/shared/widgets/paginated_loading.dart';
import 'package:sizer/sizer.dart';

class ShrimpNewsWidget extends GetView<ShrimpNewsController> {
  const ShrimpNewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: EdgeInsets.only(left: 1.w),
          child: Text(
            'Kabar terbaru',
            style: textPrimaryDark(fontSize: 18, weight: FontWeight.w700),
          ),
        ),
        SizedBox(height: 2.h),
        Expanded(
          child: RefreshIndicator.adaptive(
            onRefresh: () async {
              controller.currentPage(1);
              await controller.fetchNews(isPaginated: false);
            },
            child: Obx(
              () => PaginatedListview(
                isLoading: controller.isLoading.value,
                itemCount:
                    controller.isLoading.value ? 10 : controller.news.length,
                itemBuilder: (context, index) => controller.isLoading.value
                    ? const NewsItemLoading()
                    : NewsItem(
                        news: controller.news[index],
                      ),
                separator: SizedBox(height: 1.5.h),
                onReachLastItem: () {
                  controller.fetchNews(isPaginated: true);
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
