import 'package:flutter/material.dart';
import 'package:search_and_filtering/config/app_config.dart' as conf;

import '../core/model/response_model.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({Key? key, required this.model}) : super(key: key);

  final ResponseModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              imageView(),
              closeIcon(context),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text('Account Name : ${model.name}'),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text('Account Number : ${model.accountnumber}'),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text('State Code : ${model.statecode}'),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text('State / Province : ${model.address1Stateorprovince}'),
          ),
        ],
      ),
    );
  }

  Align closeIcon(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(top: 50.0, left: 20),
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black45,
            ),
            width: 40,
            height: 40,
            child: const Icon(
              Icons.close_rounded,
              size: 30,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Container imageView() {
    return Container(
      height: (conf.AppConfig.screenHeight ?? 0) * 0.4,
      width: conf.AppConfig.screenWidth,
      color: Colors.grey,
      child: Builder(builder: (context) {
        if (model.entityimage != null) {
          return Image(
            image: AssetImage(model.entityimage!),
          );
        } else {
          return const Icon(
            Icons.question_mark,
          );
        }
      }),
    );
  }
}
