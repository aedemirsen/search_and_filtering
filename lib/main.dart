import 'package:flutter/material.dart';
import 'package:search_and_filtering/config/app_config.dart';
import 'package:search_and_filtering/view/home_page.dart';
import 'config/app_config.dart' as conf;

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SearchAndFiltering(title: conf.appName),
    ),
  );
}

class SearchAndFiltering extends StatelessWidget {
  const SearchAndFiltering({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    initApp(context);
    return HomePage(title: title);
  }
}

void initApp(BuildContext context) {
  AppConfig.screenHeight = MediaQuery.of(context).size.height;
  AppConfig.screenWidth = MediaQuery.of(context).size.width;
}
