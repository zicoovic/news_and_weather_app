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
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.zero,
      scrollDirection: Axis.horizontal,
      itemCount: widget.categories.length,
      itemBuilder: (BuildContext context, int index) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                width: 100.w,
                height: 32.h,
                decoration: BoxDecoration(
                  color:
                      selectedIndex == index
                          ? AppColors.brandBlue
                          : Colors.white,
                  borderRadius: BorderRadius.circular(56.r),
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
    );
  }
}
