import 'package:flutter/material.dart';
import 'package:search_and_filtering/TEST.dart';
import 'package:search_and_filtering/config/app_config.dart' as conf;
import 'package:search_and_filtering/utility/page_router.dart';
import 'package:search_and_filtering/view/filter_screen.dart';

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
  late bool _isListView;

  @override
  void initState() {
    super.initState();
    _isListView = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          //search and filter
          searchAndFilter(context),
          const Divider(),
          //listview or gridview
          changeView(),
          //objects table
          _isListView ? listView(TEST.objects()) : gridView(TEST.objects()),
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
              child: const Icon(conf.listView),
              onTap: () => setState(() {
                _isListView = true;
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: GestureDetector(
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

  Padding searchAndFilter(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          //search bar
          searchBar(),
          //filter
          filter(context),
        ],
      ),
    );
  }

  Flexible filter(BuildContext context) {
    return Flexible(
      child: Center(
        child: GestureDetector(
          onTap: () {
            PageRouter.pageRouter.changePageWithAnimation(context,
                const FilterScreen(), PageRouter.pageRouter.upToDown, null);
          },
          child: const Icon(
            conf.filterIcon,
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
