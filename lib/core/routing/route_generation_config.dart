import 'package:go_router/go_router.dart';
import 'package:network_test/core/routing/app_routes.dart';
import 'package:network_test/features/article_details_screen/article_details_screen.dart';
import 'package:network_test/features/home_screen/home_screen.dart';
import 'package:network_test/features/search_screen/search_screen.dart';

class RouteGenerationConfig {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRoutes.homeScreen,
    routes: [
      GoRoute(
        path: AppRoutes.homeScreen,
        name: AppRoutes.homeScreen,
        builder: (context, state) => HomeScreen(),
      ),

      GoRoute(
        path: AppRoutes.searchResultScreen,
        name: AppRoutes.searchResultScreen,
        builder: (context, state) => SearchResultScreen(),
      ),
      GoRoute(
        path: AppRoutes.detailsScreen,
        name: AppRoutes.detailsScreen,
        builder: (context, state) => ArticleDetailsScreen(),
      ),
    ],
  );
}
