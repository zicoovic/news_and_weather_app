import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:network_test/core/styling/app_colors.dart';

class AppStyles {
  static TextStyle onBoardingTitleStyle = GoogleFonts.inter(
    fontSize: 32.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );
  static TextStyle onBoardingDescriptionStyle = GoogleFonts.inter(
    fontSize: 13.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.white,
  );

  static TextStyle white14SemiBold = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );
  static TextStyle white32SemiBold = GoogleFonts.inter(
    fontSize: 32.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );

  static TextStyle black16Medium = GoogleFonts.inter(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );
  static TextStyle black14W500 = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
  );
}
