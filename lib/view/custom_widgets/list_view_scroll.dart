import 'package:flutter/material.dart';
import 'package:search_and_filtering/config/app_config.dart' as conf;
import '../../model/object.dart';

class ListViewScroll extends StatelessWidget {
  const ListViewScroll({
    Key? key,
    required this.objects,
  }) : super(key: key);

  final List<ObjectView> objects;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: objects.length,
      itemBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: conf.listTileHeight,
          child: Card(
            child: Center(
              child: ListTile(
                leading: Image(
                  image: objects.elementAt(index).image!,
                ),
                title: Text(objects.elementAt(index).title!),
                subtitle: Text(objects.elementAt(index).payload!),
              ),
            ),
          ),
        );
      },
    );
  }
}
