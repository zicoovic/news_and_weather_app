import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:network_test/core/styling/app_colors.dart';
import 'package:network_test/features/home_screen/services/home_screen_services.dart';
import 'package:network_test/features/widgets/article_widget.dart';
import 'package:network_test/features/widgets/categories_widget.dart';
import 'package:network_test/features/widgets/top_headline_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    HomeScreenServices.getTopHeadlinesArticles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> categories = [
      'travel'.tr(),
      'technology'.tr(),
      'business'.tr(),
      'entertainment'.tr(),
    ];

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (context.locale.languageCode == 'en') {
            context.setLocale(const Locale('ar'));
          } else {
            context.setLocale(const Locale('en'));
          }
        },
        child: Icon(Icons.language_outlined, size: 30.sp),
      ),
      appBar: AppBar(
        backgroundColor: AppColors.brandBlue,
        toolbarHeight: 120.h,
        title: Text('explore'.tr()),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: FutureBuilder(
        future: HomeScreenServices.getTopHeadlinesArticles(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('error'.tr()));
          } else if (!snapshot.hasData || snapshot.data.isEmpty) {
            return Center(child: Text('no_result'.tr()));
          }
          return SingleChildScrollView(
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
                        imageUrl: snapshot.data[0].urlToImage,
                        title: snapshot.data[0].title,
                        authorName: snapshot.data[0].author ?? 'Unknown',
                        date: DateFormat.yMMMd().format(
                          snapshot.data[0].publishedAt?.toLocal() ??
                              DateTime.now(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  child: ListView.builder(
                    itemCount: snapshot.data.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return ArticleCardWidget(
                        imageUrl:
                            snapshot.data[index].urlToImage ??
                            "https://t3.ftcdn.net/jpg/03/27/55/60/360_F_327556002_99c7QmZmwocLwF7ywQ68ChZaBry1DbtD.jpg",
                        title: snapshot.data[index].title,
                        authorName: snapshot.data[index].author ?? 'Unknown',
                        date: DateFormat.yMMMd().format(
                          snapshot.data[0].publishedAt?.toLocal() ??
                              DateTime.now(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
