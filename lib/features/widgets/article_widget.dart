import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:network_test/core/styling/app_styles.dart';

class ArticleSection extends StatelessWidget {
  const ArticleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8.h),
                  Text(
                    'Apple Unveils\n Revolutionary AI Features ',
                    style: AppStyles.inter18w600,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'Abdelrahman - May 1, 2025',
                    style: AppStyles.inter12w400,
                  ),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
            Image.asset('assets/images/rectangle.png'),
          ],
        );
      },
      itemCount: 10,
      shrinkWrap: true,
      // physics: const NeverScrollableScrollPhysics(),
    );
  }
}
