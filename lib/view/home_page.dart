import 'package:flutter/material.dart';
import 'package:search_and_filtering/config/app_config.dart' as conf;

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                //search bar
                Flexible(
                  flex: 8,
                  child: TextFormField(
                    controller: controller,
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
                ),
                //filter
                const Flexible(
                  child: Center(
                    child: Icon(
                      conf.filterIcon,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Icon(conf.listView),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Icon(conf.gridView),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
