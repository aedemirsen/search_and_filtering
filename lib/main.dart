import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:search_and_filtering/config/app_config.dart';
import 'package:search_and_filtering/cubit/cubit_controller.dart';
import 'package:search_and_filtering/service/api/service.dart';
import 'package:search_and_filtering/service/auth/OAuthService.dart';
import 'package:search_and_filtering/view/home_page.dart';
import 'package:shared_preferences_android/shared_preferences_android.dart';
import 'package:shared_preferences_ios/shared_preferences_ios.dart';
import 'config/app_config.dart' as conf;

void main() {
  if (Platform.isAndroid) {
    SharedPreferencesAndroid.registerWith();
  } else if (Platform.isIOS) {
    SharedPreferencesIOS.registerWith();
  }
  runApp(
    BlocProvider(
      create: (context) => CubitController(
        OAuthService(),
        Service(Dio(BaseOptions(baseUrl: conf.baseUrl))),
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: conf.AppConfig.navigatorKey,
        home: const SearchAndFiltering(title: conf.appName),
      ),
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
