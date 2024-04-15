import 'package:flutter/material.dart';
import 'package:jala/shared/colors.dart';
import 'package:jala/shared/text_styles.dart';
import 'package:jala/shared/widgets/primary_button.dart';
import 'package:sizer/sizer.dart';

class ShrimpPriceItemLoading extends StatelessWidget {
  const ShrimpPriceItemLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.5.h),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(1.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          SizedBox(height: 1.5.h),
          Text(
            'Lorem ipsum',
            style: textGrayish(fontSize: 12),
          ),
          SizedBox(height: 1.h),
          Text(
            'Lorem ipsum',
            style: textBlack(fontSize: 12),
          ),
          SizedBox(height: 1.h),
          Text(
            'Lorem ipsum',
            style: textBlack(fontSize: 18, weight: FontWeight.w700),
          ),
          SizedBox(height: 1.h),
          _buildFooter(),
        ],
      ),
    );
  }

  Widget _buildHeader() => Row(
        children: [
          SizedBox(width: 2.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Supplier',
                style: textGrayish(fontSize: 12),
              ),
              Text(
                'Lorem ipsum',
                style: textBlack(),
              ),
            ],
          ),
          const Spacer(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: .5.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              color: borderColor,
            ),
            child: Row(
              children: [
                Row(
                  children: [
                    SizedBox(width: 1.w),
                  ],
                ),
                Text(
                  'Belum terverifikasi',
                  style: textBlack(fontSize: 12),
                ),
              ],
            ),
          )
        ],
      );

  Widget _buildFooter() => Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Size:',
                style: textGrayish(fontSize: 12),
              ),
              SizedBox(height: .5.h),
              Text(
                'Lorem ipsum',
                style: textBlack(fontSize: 22, weight: FontWeight.w900),
              ),
            ],
          ),
          const Spacer(),
          PrimaryButton(label: 'LHAT DETAIL', onPressed: () {})
        ],
      );
}
