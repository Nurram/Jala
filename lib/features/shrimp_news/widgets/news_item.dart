import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:jala/controllers/shrimp_news_controller.dart';
import 'package:jala/shared/widgets/webview_screen.dart';
import 'package:jala/models/shrimp_news_response.dart';
import 'package:jala/shared/colors.dart';
import 'package:jala/shared/text_styles.dart';
import 'package:jala/shared/utils.dart';
import 'package:jala/shared/widgets/cached_image.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sizer/sizer.dart';
import 'package:skeletonizer/skeletonizer.dart';

class NewsItem extends GetView<ShrimpNewsController> {
  final NewsDatum news;

  const NewsItem({
    super.key,
    required this.news,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.newsProgress(0);

        final url = Uri.parse('${dotenv.env['SHARE_URL']}/posts/${news.id}');
        Get.to(
          () => WebviewScreen(title: news.title ?? '', url: url),
        );
      },
      child: Obx(
        () => Skeletonizer(
          enabled: controller.isLoading.value,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(2.w),
                  topRight: Radius.circular(2.w),
                ),
                child: AspectRatio(
                  aspectRatio: 2 / 1,
                  child: controller.isLoading.value || news.image == null
                      ? Image.asset(
                          getImageAsset(assetName: 'placeholder.png'),
                          width: double.infinity,
                          fit: BoxFit.cover,
                        )
                      : CachedImage(
                          url: '${dotenv.env['IMAGE_URL']}/${news.image}',
                          width: double.infinity,
                          radius: const BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                        ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.5.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      news.title ?? '',
                      style: textBlack(fontSize: 18, weight: FontWeight.w900),
                    ),
                    SizedBox(height: 1.h),
                    Text(
                      news.excerpt ?? '',
                      maxLines: 2,
                      style: textUnselected(),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 1.5.h),
                    Row(
                      children: [
                        Text(
                          formatDate(
                            pattern: 'dd MMMM yyyy',
                            date: news.createdAt ?? DateTime.now(),
                          ),
                          style: textUnselected(),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            Share.share(
                              '${news.title}\n'
                              '${dotenv.env['SHARE_URL']}/posts/${news.id}',
                            );
                          },
                          child: const Icon(
                            Icons.share_outlined,
                            size: 24,
                            color: blackColor,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
