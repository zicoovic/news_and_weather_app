// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:network_test/core/styling/app_styles.dart';

class ArticleCardWidget extends StatelessWidget {
  final String? imageUrl;
  final String title;
  final String authorName;
  final String date;
  const ArticleCardWidget({
    super.key,
    this.imageUrl,
    required this.title,
    required this.authorName,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8.h),
                SizedBox(
                  width: 238.w,
                  child: Text(title, style: AppStyles.inter18w600),
                ),
                SizedBox(height: 4.h),
                Text('$authorName - $date', style: AppStyles.inter12w400),
                SizedBox(height: 24.h),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: CachedNetworkImage(
              width: 112.w,
              height: 80.h,
              fit: BoxFit.fill,
              imageUrl:
                  imageUrl ??
                  "https://t3.ftcdn.net/jpg/03/27/55/60/360_F_327556002_99c7QmZmwocLwF7ywQ68ChZaBry1DbtD.jpg",
              placeholder:
                  (context, url) => Center(
                    child: CircularProgressIndicator(),
                  ), // Add a placeholder
              errorWidget:
                  (context, url, error) => Center(child: Icon(Icons.error)),
            ),
          ),
        ],
      ),
    );
  }
}
