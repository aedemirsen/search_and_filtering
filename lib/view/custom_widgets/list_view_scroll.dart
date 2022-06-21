import 'package:flutter/material.dart';
import 'package:search_and_filtering/config/app_config.dart' as conf;
import 'package:search_and_filtering/utility/page_router.dart';
import 'package:search_and_filtering/view/details_screen.dart';

import '../../core/model/response_model.dart';

class ListViewScroll extends StatelessWidget {
  const ListViewScroll({
    Key? key,
    required this.objects,
  }) : super(key: key);

  final List<ResponseModel> objects;

  @override
  Widget build(BuildContext context) {
    if (objects.isEmpty) {
      return const Text('No Record Found');
    }
    return ListView.builder(
      key: const Key('listView'),
      itemCount: objects.length,
      itemBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: conf.listTileHeight,
          child: GestureDetector(
            child: Card(
              child: Center(
                child: ListTile(
                  leading: const Icon(
                    Icons.question_mark,
                  ),
                  // leading: Builder(builder: (context) {
                  //   if (objects.elementAt(index).entityimage != null) {
                  //     return Image(
                  //       image:
                  //           AssetImage(objects.elementAt(index).entityimage!),
                  //     );
                  //   } else {
                  //     return const Icon(
                  //       Icons.question_mark,
                  //     );
                  //   }
                  // }),
                  title: Text(objects.elementAt(index).name!),
                  subtitle:
                      Text(objects.elementAt(index).accountnumber.toString()),
                ),
              ),
            ),
            onTap: () {
              PageRouter.changePageWithAnimation(
                  context,
                  DetailsView(model: objects.elementAt(index)),
                  PageRouter.downToUp);
            },
          ),
        );
      },
    );
  }
}
