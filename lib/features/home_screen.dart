import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:network_test/core/styling/app_colors.dart';
import 'package:network_test/features/widgets/article_widget.dart';
import 'package:network_test/features/widgets/categories_widget.dart';
import 'package:network_test/features/widgets/top_headline_item.dart';

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
        toolbarHeight: 120.h,
        title: Text('explore'.tr()),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            CategoriesSection(categories: categories),
            SizedBox(height: 24.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TopHeadlineItem(
                    title: 'Apple Unveils Revolutionary AI Features',
                    authorName: 'Abdelrahman -',
                    date: ' May 1, 2025',
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  ArticleCardWidget(
                    title: 'Apple Unveils Revolutionary AI Features',
                    authorName: 'Abdelrahman -',
                    date: ' May 1, 2025',
                  ),
                  ArticleCardWidget(
                    title: 'Apple Unveils Revolutionary AI Features',
                    authorName: 'Abdelrahman -',
                    date: ' May 1, 2025',
                  ),
                  ArticleCardWidget(
                    title: 'Apple Unveils Revolutionary AI Features',
                    authorName: 'Abdelrahman -',
                    date: ' May 1, 2025',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
