import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:network_test/core/constant/constant.dart';
import 'package:network_test/core/routing/app_routes.dart';
import 'package:network_test/core/styling/app_colors.dart';
import 'package:network_test/features/home_screen/services/home_screen_services.dart';
import 'package:network_test/features/widgets/article_widget.dart';
import 'package:network_test/features/widgets/categories_widget.dart';
import 'package:network_test/features/widgets/custom_text_field.dart';
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

  TextEditingController searchController = TextEditingController();
  bool isSearch = false;
  void toggleSearch() {
    setState(() {
      isSearch = !isSearch;
    });
    if (!isSearch) {
      searchController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (AppConstant.lang == 'ar') {
            AppConstant.lang = 'en';
          } else {
            AppConstant.lang = 'ar';
          }
          AppConstant.lang = AppConstant.lang;
          context.setLocale(Locale(AppConstant.lang));
          setState(() {});
        },
        child: Icon(Icons.language_outlined, size: 30.sp),
      ),
      appBar: AppBar(
        backgroundColor: AppColors.brandBlue,
        toolbarHeight: 120.h,
        title: Text('explore'.tr()),
        actions: [
          Row(
            children: [
              isSearch
                  ? CustomTextField(
                    controller: searchController,
                    hintText: 'search'.tr(),
                    width: 200.w,
                    onFieldSubmitted: (searchTerm) {
                      if (searchTerm.isNotEmpty) {
                        GoRouter.of(
                          context,
                        ).push('/searchResult', extra: searchTerm);
                      }
                    },
                    suffixIcon: IconButton(
                      icon: Icon(Icons.close, size: 30.sp),
                      onPressed: toggleSearch,
                    ),
                  )
                  : const SizedBox.shrink(),
              IconButton(
                icon: Icon(Icons.search, size: 30.sp),
                onPressed: toggleSearch,
              ),
            ],
          ),
        ],
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
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 32.w),
                  child: SizedBox(
                    height: 40.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      children: [
                        CustomCategoryItemWidget(
                          title: "travel".tr(),
                          onTap: () {
                            GoRouter.of(
                              context,
                            ).push('/searchResult', extra: "travel");
                          },
                        ),
                        CustomCategoryItemWidget(
                          title: "technology".tr(),
                          onTap: () {
                            GoRouter.of(
                              context,
                            ).push('/searchResult', extra: "technology");
                          },
                        ),
                        CustomCategoryItemWidget(
                          title: "business".tr(),
                          onTap: () {
                            GoRouter.of(
                              context,
                            ).push('/searchResult', extra: "business");
                          },
                        ),
                        CustomCategoryItemWidget(
                          title: "entertainment".tr(),
                          onTap: () {
                            GoRouter.of(
                              context,
                            ).push('/searchResult', extra: "entertainment");
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                SizedBox(height: 24.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          GoRouter.of(context).pushNamed(
                            AppRoutes.articlesDetailsScreen,
                            extra: snapshot.data[0],
                          );
                        },
                        child: TopHeadlineItem(
                          imageUrl:
                              snapshot.data[0].urlToImage ??
                              ' https://t3.ftcdn.net/jpg/03/27/55/60/360_F_327556002_99c7QmZmwocLwF7ywQ68ChZaBry1DbtD.jpg',
                          title: snapshot.data[0].title ?? 'No Title',
                          authorName: snapshot.data[0].author ?? 'Unknown',
                          date: DateFormat.yMMMd().format(
                            snapshot.data[0].publishedAt?.toLocal() ??
                                DateTime.now(),
                          ),
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
                      return InkWell(
                        onTap: () {
                          GoRouter.of(
                            context,
                          ).push('/detailsScreen', extra: snapshot.data[index]);
                        },
                        child: ArticleCardWidget(article: snapshot.data[index]),
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
