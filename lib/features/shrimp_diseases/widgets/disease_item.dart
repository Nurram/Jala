import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:jala/models/shrimp_disease_response.dart';
import 'package:jala/shared/widgets/webview_screen.dart';
import 'package:jala/shared/colors.dart';
import 'package:jala/shared/text_styles.dart';
import 'package:jala/shared/utils.dart';
import 'package:jala/shared/widgets/cached_image.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sizer/sizer.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../controllers/shrimp_diseases_controller.dart';

class DiseaseItem extends GetView<ShrimpDiseasesController> {
  final ShrimpDiseaseDatum disease;

  const DiseaseItem({
    super.key,
    required this.disease,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.diseaseProgress(0);

        final url =
            Uri.parse('${dotenv.env['SHARE_URL']}/diseases/${disease.id}');
        Get.to(
          () => WebviewScreen(title: 'Info Penyakit', url: url),
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
                  child: controller.isLoading.value || disease.image == null
                      ? Image.asset(
                          getImageAsset(assetName: 'placeholder.png'),
                          width: double.infinity,
                          fit: BoxFit.cover,
                        )
                      : CachedImage(
                          url: '${dotenv.env['IMAGE_URL']}/${disease.image}',
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
                      disease.fullName ?? '',
                      style: textBlack(fontSize: 18, weight: FontWeight.w900),
                    ),
                    SizedBox(height: 1.h),
                    Text(
                      disease.metaDescription ?? '',
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
                            date: disease.createdAt ?? DateTime.now(),
                          ),
                          style: textUnselected(),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            Share.share(
                              '${disease.fullName}\n'
                              '${dotenv.env['SHARE_URL']}/diseases/${disease.id}',
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
