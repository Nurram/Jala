import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:jala/models/shrimp_price_detail_response.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../shared/text_styles.dart';
import '../../../shared/utils.dart';
import '../../../shared/widgets/cached_image.dart';
import '../../../shared/widgets/primary_button.dart';
import '../../../shared/widgets/verified_widget.dart';

class DetailHeader extends StatelessWidget {
  final PriceDetailData? data;

  const DetailHeader({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final creator = data?.creator;

    return Column(
      children: [
        Row(
          children: [
            Text(
              formatDate(
                pattern: 'dd MMMM yyyy',
                date: data?.date ?? DateTime.now(),
              ),
              style: textUnselected(),
            ),
            SizedBox(width: 3.w),
            VerifiedWidget(creator: creator),
          ],
        ),
        SizedBox(height: .5.h),
        Row(
          children: [
            Visibility(
              visible: creator != null,
              child: CachedImage(
                url: '${dotenv.env['IMAGE_URL']}/${creator?.avatar}',
              ),
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
                  creator?.name ?? '',
                  style: textBlack(),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Kontak',
                    style: textGrayish(fontSize: 12),
                  ),
                  Text(
                    creator?.phone ?? '',
                    style: textBlack(weight: FontWeight.w700, fontSize: 16),
                  ),
                ],
              ),
            ),
            PrimaryButton(
                label: 'Hubungi',
                onPressed: () {
                  final uri = Uri.parse('tel:${creator?.phone}');
                  launchUrl(uri);
                })
          ],
        )
      ],
    );
  }
}
