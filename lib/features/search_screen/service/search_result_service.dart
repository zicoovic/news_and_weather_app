import 'dart:developer';

import 'package:network_test/core/constant/constant.dart';
import 'package:network_test/core/networking/api_endpoints.dart';
import 'package:network_test/core/networking/dio_helper.dart';
import 'package:network_test/features/home_screen/models/top_headline_model.dart';

class SearchResultService {
  static searchItemByName(String query) async {
    try {
      final response = await DioHelper.getRequest(
        endPoint: ApiEndpoints.searchEndPoint,
        query: {
          'q': query,
          'apiKey': AppConstant.newsApiKey,
          "language": AppConstant.lang,
        },
      );

      if (response.statusCode == 200) {
        ArticlesModel searchModel = ArticlesModel.fromJson(response.data);
        return searchModel.articles;
      } else {
        log('Error: ${response.statusCode} - ${response.statusMessage}');
        return [];
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
