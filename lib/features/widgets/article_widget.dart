// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:network_test/core/routing/app_routes.dart';

import 'package:network_test/core/styling/app_styles.dart';
import 'package:network_test/features/home_screen/models/top_headline_model.dart';

class ArticleCardWidget extends StatelessWidget {
  final Article? article;

  const ArticleCardWidget({super.key, this.article});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(
          context,
        ).pushNamed(AppRoutes.articlesDetailsScreen, extra: article);
      },
      child: Padding(
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
                    child: Text(
                      article?.title ?? "No Title",
                      style: AppStyles.inter18w600.copyWith(
                        overflow: TextOverflow.ellipsis,
                        // height: 1.2,
                      ),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  SizedBox(height: 8.h),
                  SizedBox(
                    width: 238.w,
                    child: Text(
                      article?.description ?? "No Description",
                      style: AppStyles.inter14w600.copyWith(),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    '${(article?.author?.split(',').first ?? 'Unknown Author').trim()}. ${article?.publishedAt != null ? DateFormat.yMMMd().format(article!.publishedAt!.toLocal()) : 'Unknown Date'}',
                    style: AppStyles.inter14w600.copyWith(color: Colors.grey),
                    overflow: TextOverflow.ellipsis,
                  ),
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
                    article?.urlToImage ??
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
      ),
    );
  }
}
