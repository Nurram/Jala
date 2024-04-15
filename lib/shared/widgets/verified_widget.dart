import 'package:flutter/material.dart';
import 'package:jala/models/creator.dart';
import 'package:sizer/sizer.dart';

import '../colors.dart';
import '../text_styles.dart';
import '../utils.dart';

class VerifiedWidget extends StatelessWidget {
  final Creator? creator;

  const VerifiedWidget({
    super.key,
    required this.creator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: .5.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        color: (creator?.buyer ?? false) ? semiYellowColor : borderColor,
      ),
      child: Row(
        children: [
          Visibility(
            visible: (creator?.buyer ?? false),
            child: Row(
              children: [
                Image.asset(
                  getImageAsset(assetName: 'star_rounded.png'),
                  width: 4.w,
                  height: 2.h,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 1.w),
              ],
            ),
          ),
          Text(
            (creator?.buyer ?? false) ? 'Terverifikasi' : 'Belum terverifikasi',
            style: textBlack(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
