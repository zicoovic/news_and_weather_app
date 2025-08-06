// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:network_test/core/styling/app_styles.dart';
import 'package:network_test/features/home_screen/models/top_headline_model.dart';

class TopHeadlineItem extends StatelessWidget {
  final String? imageUrl;
  final String title;
  final String authorName;
  final String date;
  final Article? article;
  const TopHeadlineItem({
    super.key,
    this.imageUrl,
    required this.title,
    required this.authorName,
    required this.date,
    this.article,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.r),
          child: CachedNetworkImage(
            // width: double.infinity,
            height: 260.h,
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
        const SizedBox(height: 16),
        Text(title, style: AppStyles.inter18w600),
        const SizedBox(height: 12),
        Row(
          children: [
            Text(
              '$authorName - '.split(',')[0], // Display only the date part'),
              style: AppStyles.inter12w400.copyWith(
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              ' $date',
              style: AppStyles.inter12w400.copyWith(
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
