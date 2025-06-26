import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:network_test/core/routing/app_routes.dart';
import 'package:network_test/features/home_screen.dart';

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
        path: AppRoutes.searchScreen,
        name: AppRoutes.searchScreen,
        builder: (context, state) => Container(),
      ),
      GoRoute(
        path: AppRoutes.searchResultScreen,
        name: AppRoutes.searchResultScreen,
        builder: (context, state) => Container(),
      ),
      GoRoute(
        path: AppRoutes.detailsScreen,
        name: AppRoutes.detailsScreen,
        builder: (context, state) => Container(),
      ),
    ],
  );
}
