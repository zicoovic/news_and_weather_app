import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:network_test/core/styling/app_colors.dart';

class CategoriesSection extends StatefulWidget {
  const CategoriesSection({super.key, required this.categories});

  final List<String> categories;

  @override
  State<CategoriesSection> createState() => _CategoriesSectionState();
}

class _CategoriesSectionState extends State<CategoriesSection> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 32.w),
      child: SizedBox(
        height: 40.h,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          itemCount: widget.categories.length,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.brandBlue,
                        width: 1.w,
                      ),
                      borderRadius: BorderRadius.circular(56.r),
                      color: Colors.transparent,
                    ),
                    child: Center(
                      child: Text(
                        widget.categories[index],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 36.w),
              ],
            );
          },
        ),
      ),
    );
  }
}
