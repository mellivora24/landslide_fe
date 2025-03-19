import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final locale = context.locale;

    return Scaffold(
      appBar: AppBar(
        title: Text('home_screen.title'.tr()),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('home_screen.message'.tr()),
            Text('home_screen.locale'.tr(args: [locale.languageCode])),
          ],
        ),
      ),
    );
  }
}
