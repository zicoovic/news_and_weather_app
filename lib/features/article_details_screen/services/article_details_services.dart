import 'dart:developer';

import 'package:network_test/core/constant/constant.dart';
import 'package:network_test/core/networking/api_endpoints.dart';
import 'package:network_test/core/networking/dio_helper.dart';
import 'package:network_test/features/home_screen/models/top_headline_model.dart';

class ArticleService {
  static getArticlesDetails() async {
    try {
      final response = await DioHelper.getRequest(
        endPoint: ApiEndpoints.searchEndPoint,
        query: {'country': 'q', 'apiKey': AppConstant.newsApiKey},
      );

      if (response.statusCode == 200) {
        ArticlesModel articleDetailsModel = ArticlesModel.fromJson(
          response.data,
        );
        return articleDetailsModel.articles;
      } else {
        log('Error: ${response.statusCode} - ${response.statusMessage}');
        return [];
      }
    } catch (e) {
      log('Exception: $e');
      return [];
    }
  }
}
