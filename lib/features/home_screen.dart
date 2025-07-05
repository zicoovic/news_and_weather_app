import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:network_test/core/styling/app_colors.dart';
import 'package:network_test/core/styling/app_styles.dart';
import 'package:network_test/features/widgets/article_widget.dart';
import 'package:network_test/features/widgets/categories_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> categories = [
      'travel'.tr(),
      'technology'.tr(),
      'business'.tr(),
      'entertainment'.tr(),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.brandBlue,
        title: Text('explore'.tr()),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            SizedBox(
              height: 32.h,
              child: CategoriesSection(categories: categories),
            ),
            SizedBox(height: 20),
            Image.asset('assets/images/image.png'),
            SizedBox(height: 16),
            Text(
              'Apple Unveils Revolutionary AI Features',
              style: AppStyles.inter18w600,
            ),
            SizedBox(height: 12.h),
            Text('Abdelrahman - May 1, 2025', style: AppStyles.inter12w400),
            SizedBox(height: 30.h),
            Expanded(child: ArticleSection()),
          ],
        ),
      ),
    );
  }
}
