import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../config/app_config.dart' as conf;

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: conf.filterScreenBackgroundColor,
      body: Center(
        child: Container(
          width: conf.filterScreenWidth,
          height: conf.filterScreenHeight,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(conf.filteScreenRadius),
          ),
          child: Column(
            children: [
              //header
              filterHeader(context),
              //filters
              Expanded(
                child: SizedBox(),
              ),
              //button
              filterButton(context),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox filterButton(BuildContext context) {
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
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  SizedBox filterHeader(BuildContext context) {
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
                  Navigator.pop(context);
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
}
