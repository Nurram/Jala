import 'package:flutter/material.dart';
import 'package:jala/shared/colors.dart';
import 'package:jala/shared/text_styles.dart';
import 'package:jala/shared/utils.dart';
import 'package:sizer/sizer.dart';
import 'package:skeletonizer/skeletonizer.dart';

class NewsItemLoading extends StatelessWidget {
  const NewsItemLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(2.w),
              topRight: Radius.circular(2.w),
            ),
            child: AspectRatio(
              aspectRatio: 2 / 1,
              child: Image.asset(
                getImageAsset(assetName: 'jali.png'),
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.5.h),
            child: Column(
              children: [
                Text(
                  '',
                  style: textBlack(fontSize: 18, weight: FontWeight.w900),
                ),
                SizedBox(height: 1.h),
                Text(
                  '',
                  maxLines: 2,
                  style: textUnselected(),
                ),
                SizedBox(height: 1.5.h),
                Row(
                  children: [
                    Text(
                      '',
                      style: textUnselected(),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.share_outlined,
                      size: 24,
                      color: blackColor,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
