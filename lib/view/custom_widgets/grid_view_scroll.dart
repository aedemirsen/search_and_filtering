import 'package:flutter/material.dart';
import 'package:search_and_filtering/model/response_model.dart';

import '../../utility/page_router.dart';
import '../details_screen.dart';

class GridViewScroll extends StatelessWidget {
  const GridViewScroll({
    Key? key,
    required this.objects,
  }) : super(key: key);

  final List<ResponseModel> objects;

  @override
  Widget build(BuildContext context) {
    if (objects.isEmpty) {
      return const Text('No Record Found');
    }
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: objects.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: objects.elementAt(index).entityimageUrl,
                ),
                Text(objects.elementAt(index).name!),
                Text(objects.elementAt(index).accountnumber.toString()),
              ],
            ),
          ),
          onTap: () {
            PageRouter.changePageWithAnimation(
                context,
                DetailsView(model: objects.elementAt(index)),
                PageRouter.downToUp);
          },
        );
      },
    );
  }
}
