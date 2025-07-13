import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:network_test/core/styling/app_styles.dart';
import 'package:network_test/features/search_screen/service/search_result_service.dart';
import 'package:network_test/features/widgets/article_widget.dart';

class SearchResultScreen extends StatefulWidget {
  const SearchResultScreen({super.key});

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  @override
  void initState() {
    SearchResultService.searchItemByName("Apple");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Search Results', style: AppStyles.inter18w600),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 32.w, right: 32.w, top: 24.h),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return FutureBuilder(
                future: SearchResultService.searchItemByName("Apple"),
                builder: (
                  BuildContext context,
                  AsyncSnapshot<dynamic> snapshot,
                ) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('error'.tr()));
                  } else if (!snapshot.hasData || snapshot.data.isEmpty) {
                    return Center(child: Text('no_result'.tr()));
                  }
                  return ArticleCardWidget(
                    imageUrl:
                        snapshot.data[index].urlToImage ??
                        "https://t3.ftcdn.net/jpg/03/27/55/60/360_F_327556002_99c7QmZmwocLwF7ywQ68ChZaBry1DbtD.jpg",
                    title: snapshot.data[index].title,
                    authorName: snapshot.data[index].author ?? 'Unknown',
                    date: DateFormat.yMMMd().format(
                      snapshot.data[0].publishedAt?.toLocal() ?? DateTime.now(),
                    ),
                  );
                },
              );
            },
            itemCount: 10,
          ),
        ),
      ),
    );
  }

  PreferredSize searchAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(70),
      child: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search articles...',
              prefixIcon: Icon(Icons.search),
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
              fillColor: Colors.grey[200],
            ),
            onChanged: (value) {
              // Call search logic here
              print("Searching for: $value");
            },
          ),
        ),
      ),
    );
  }
}
