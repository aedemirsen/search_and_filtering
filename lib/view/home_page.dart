import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:search_and_filtering/TEST.dart';
import 'package:search_and_filtering/config/app_config.dart' as conf;
import 'package:search_and_filtering/service/auth/IOAuthService.dart';
import 'package:search_and_filtering/service/auth/OAuthService.dart';

import 'custom_widgets/grid_view_scroll.dart';
import 'custom_widgets/list_view_scroll.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  late bool _isListView, _isFilterOpen;
  String? _statusCode, _stateProvince;

  @override
  void initState() {
    super.initState();
    _isListView = true;
    _isFilterOpen = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          mainPage(),
          transparentBackground(),
          filterScreen(),
        ],
      ),
    );
  }

  Column mainPage() {
    return Column(
      children: [
        //search and filter
        searchAndFilter(),
        const Divider(),
        //listview or gridview
        changeView(),
        //objects table
        _isListView ? listView(TEST.objects()) : gridView(TEST.objects()),
      ],
    );
  }

  Visibility filterScreen() {
    return Visibility(
      visible: _isFilterOpen,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.blue),
            color: Colors.white,
          ),
          width: conf.filterScreenWidth,
          height: conf.filterScreenHeight,
          child: Column(
            children: [
              //header
              filterHeader(),
              const Divider(),
              const Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              const Text('Status Code'),
              SizedBox(
                width: conf.filterScreenWidth * 0.8,
                child: DropdownButton<String>(
                  value: _statusCode ?? "-",
                  icon: const SizedBox.shrink(),
                  elevation: 16,
                  onChanged: (String? newValue) {
                    setState(() {
                      _statusCode = newValue!;
                    });
                  },
                  items: <String>["-", 'One', 'Two', 'Free', 'Four']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              const Text('State / Province'),
              SizedBox(
                width: conf.filterScreenWidth * 0.8,
                child: DropdownButton<String>(
                  value: _stateProvince ?? "-",
                  icon: const SizedBox.shrink(),
                  elevation: 16,
                  onChanged: (String? newValue) {
                    setState(() {
                      _stateProvince = newValue!;
                    });
                  },
                  items: <String>["-", 'One', 'Two', 'Free', 'Four']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              //filters
              Expanded(
                child: SizedBox(),
              ),
              //button
              filterButton(),
            ],
          ),
        ),
      ),
    );
  }

  Visibility transparentBackground() {
    return Visibility(
      visible: _isFilterOpen,
      child: Container(
        color: Colors.transparent.withOpacity(0.5),
      ),
    );
  }

  SizedBox filterButton() {
    return SizedBox(
      height: conf.filterButtonHeight,
      width: conf.filterScreenWidth,
      child: CupertinoButton(
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(conf.filteScreenRadius),
          bottomLeft: Radius.circular(conf.filteScreenRadius),
        ),
        color: Colors.blue,
        child: const Text("Filter"),
        onPressed: () async {
          IOAuthService s = OAuthService();
          await s.loginAction();
          // setState(() {
          //   _isFilterOpen = false;
          // });
        },
      ),
    );
  }

  SizedBox filterHeader() {
    return SizedBox(
      height: conf.filtersHeaderHeight,
      child: Stack(
        alignment: Alignment.center,
        children: [
          //back icon
          Padding(
            padding: const EdgeInsets.fromLTRB(3, 3, 0, 0),
            child: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    _isFilterOpen = false;
                  });
                },
                icon: const Icon(
                  CupertinoIcons.arrow_left,
                  color: Colors.black,
                  size: 40,
                ),
                splashRadius: 23,
                padding: EdgeInsets.zero,
              ),
            ),
          ),
          //header
          const Text(
            "Filter",
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
            ),
          ),
        ],
      ),
    );
  }

  Expanded gridView(var list) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(
          left: conf.listTileInset,
          right: conf.listTileInset,
        ),
        child: GridViewScroll(objects: list),
      ),
    );
  }

  Expanded listView(var list) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(
          left: conf.listTileInset,
          right: conf.listTileInset,
        ),
        child: ListViewScroll(objects: list),
      ),
    );
  }

  Padding changeView() {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: GestureDetector(
              key: const Key("listViewIcon"),
              child: const Icon(conf.listView),
              onTap: () => setState(() {
                _isListView = true;
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: GestureDetector(
              key: const Key("gridViewIcon"),
              child: const Icon(conf.gridView),
              onTap: () => setState(() {
                _isListView = false;
              }),
            ),
          ),
        ],
      ),
    );
  }

  Padding searchAndFilter() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8.0,
        bottom: 8.0,
        left: conf.listTileInset,
      ),
      child: Row(
        children: [
          //search bar
          searchBar(),
          //filter
          filterIcon(),
        ],
      ),
    );
  }

  Flexible filterIcon() {
    return Flexible(
      child: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _isFilterOpen = true;
            });
          },
          child: const Icon(
            conf.filterIcon,
            key: Key("filter"),
          ),
        ),
      ),
    );
  }

  Flexible searchBar() {
    return Flexible(
      flex: 8,
      child: TextFormField(
        controller: searchController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          prefixIcon: const Icon(
            conf.searchIcon,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          hintText: "Search",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
