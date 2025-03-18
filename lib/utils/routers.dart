import 'package:flutter/material.dart';
import 'package:landslide_fe/utils/router_names.dart';
import 'package:landslide_fe/screen/home/view/home_screen.dart';
import 'package:landslide_fe/screen/landing/view/landing_screen.dart';

final Map<String, WidgetBuilder> routes = {
  RouteNames.homeScreen: (context) => const HomeScreen(),
  RouteNames.landingScreen: (context) => const LandingScreen(),
};

MaterialPageRoute<dynamic>? generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case RouteNames.landingScreen:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const LandingScreen(),
      );
    case RouteNames.homeScreen:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const HomeScreen(),
      );
    default:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const LandingScreen(),
      );
  }
}