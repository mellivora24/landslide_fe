import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:landslide_fe/features/welcome/presentation/screens/welcome_screen.dart';
import 'package:landslide_fe/features/survey/presentation/screens/survey_user_screen.dart';
import 'package:landslide_fe/features/survey/presentation/screens/survey_admin_screen.dart';

// Cấu hình các routes
final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const WelcomeScreen();
      },
    ),
    GoRoute(
      path: '/user',
      builder: (BuildContext context, GoRouterState state) {
        return const UserScreen();
      },
    ),
    GoRoute(
      path: '/admin',
      builder: (BuildContext context, GoRouterState state) {
        return const AdminScreen();
      },
    ),
  ],
);
