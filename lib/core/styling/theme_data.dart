import 'package:flutter/material.dart';

import 'package:network_test/core/styling/app_colors.dart';

import 'package:network_test/core/styling/app_styles.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    // primaryColor: AppColors.orange,
    scaffoldBackgroundColor: AppColors.white,
    // fontFamily: AppFonts.mainFontName,
    textTheme: TextTheme(
      titleLarge: AppStyles.onBoardingTitleStyle,
      // titleMedium: AppStyles.subTitleStyle,
    ),
    buttonTheme: ButtonThemeData(
      // buttonColor: AppColors.orange,
      textTheme: ButtonTextTheme.primary,
      // disabledColor: AppColors.secondary,
    ),
  );
}
