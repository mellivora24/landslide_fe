import 'package:flutter/material.dart';
import 'package:landslide_fe/core/routers/app_router.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Landslide Warning System',
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
