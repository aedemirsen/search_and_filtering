import 'package:flutter/material.dart';

import '../../core/model/response_model.dart';
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
                const Icon(
                  Icons.question_mark,
                ),
                // Builder(builder: (context) {
                //   if (objects.elementAt(index).entityimage != null) {
                //     return Image(
                //       image: AssetImage(objects.elementAt(index).entityimage!),
                //     );
                //   } else {
                //     return const Icon(
                //       Icons.question_mark,
                //     );
                //   }
                // }),
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
