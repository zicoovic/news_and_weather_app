import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:network_test/core/styling/app_styles.dart';

class CustomCategoryItemWidget extends StatelessWidget {
  final String title;
  final Function() onTap;
  const CustomCategoryItemWidget({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.w),
      child: InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 6.h),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xffE9EEFA), width: 1),
            borderRadius: BorderRadius.circular(56.r),
            color: Colors.transparent,
          ),
          child: Text(
            title,
            style: AppStyles.inter14w600.copyWith(
              color: const Color(0xff1A1A1A),
            ),
          ),
        ),
      ),
    );
  }
}
