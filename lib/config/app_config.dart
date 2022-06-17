import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppConfig {
  static double? screenHeight, screenWidth;
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}

//OAuth2
const String dynamicCrm =
    'https://org3c92a778.api.crm4.dynamics.com/api/data/v9.2';
const String clientId = 'ad951783-c767-4fde-9569-ca02afe1b34c';

const String tenantId = '3c0373be-a110-4245-bebe-dd3b9beb76d0';
const String redirectUrl = 'https://login.live.com/oauth20_desktop.srf';

//api
const String baseUrl = "{{url}}/api/data/v{{version}}";

//aedemirsen@aedesium.onmicrosoft.com

//home screen
const String appName = "Search and Filtering";
const IconData searchIcon = Icons.search;
const IconData filterIcon = CupertinoIcons.slider_horizontal_3;
const IconData listView = Icons.list;
const IconData gridView = Icons.grid_view;
const double listTileHeight = 100;
const double listTileInset = 20;

//filter screen
final double filterScreenWidth = (AppConfig.screenWidth ?? 0) * 0.7;
final double filterScreenHeight = (AppConfig.screenHeight ?? 0) * 0.5;
const double filtersHeaderHeight = 50;
const double filterButtonHeight = 50;
const double filteScreenRadius = 20;
final Color filterScreenBackgroundColor = Colors.transparent.withOpacity(0.6);
