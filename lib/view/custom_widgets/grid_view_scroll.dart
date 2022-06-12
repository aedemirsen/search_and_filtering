import 'package:flutter/material.dart';
import '../../model/object.dart';

class GridViewScroll extends StatelessWidget {
  const GridViewScroll({
    Key? key,
    required this.objects,
  }) : super(key: key);

  final List<ObjectView> objects;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: objects.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: objects.elementAt(index).image!,
              ),
              Text(objects.elementAt(index).title!),
              Text(objects.elementAt(index).payload!),
            ],
          ),
        );
      },
    );
  }
}
