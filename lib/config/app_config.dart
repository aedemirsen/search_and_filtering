import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppConfig {
  static double? screenHeight, screenWidth;
}

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
final double filterScreenHeight = (AppConfig.screenHeight ?? 0) * 0.55;
const double filtersHeaderHeight = 50;
const double filterButtonHeight = 50;
const double filteScreenRadius = 20;
final Color filterScreenBackgroundColor = Colors.transparent.withOpacity(0.6);
