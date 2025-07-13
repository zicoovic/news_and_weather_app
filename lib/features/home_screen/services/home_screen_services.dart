import 'dart:developer';

import 'package:network_test/core/constant/constant.dart';
import 'package:network_test/core/networking/api_endpoints.dart';
import 'package:network_test/core/networking/dio_helper.dart';
import 'package:network_test/features/home_screen/models/top_headline_model.dart';

class HomeScreenServices {
  static getTopHeadlinesArticles() async {
    try {
      final response = await DioHelper.getRequest(
        endPoint: ApiEndpoints.topHeadlines,
        query: {'country': 'us', 'apiKey': AppConstant.newsApiKey},
      );

      if (response.statusCode == 200) {
        ArticlesModel topHeadLinesModel = ArticlesModel.fromJson(response.data);
        return topHeadLinesModel.articles;
      } else {
        log('Error: ${response.statusCode} - ${response.statusMessage}');
        return [];
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
