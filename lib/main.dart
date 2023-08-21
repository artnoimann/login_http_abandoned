import 'package:flutter/material.dart';
import 'package:unforgett/const/routes_name.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() async {
  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: '_',
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
