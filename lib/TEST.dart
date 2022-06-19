import 'package:flutter/material.dart';
import 'package:search_and_filtering/model/response_model.dart';

class TEST {
  static List<ResponseModel> objects() {
    List<ResponseModel> objects = [];
    ResponseModel o1 = ResponseModel();
    o1.entityimageUrl = const AssetImage('assets/avatar.jpeg');
    o1.name = "A";
    o1.accountnumber = 1;
    o1.statecode = 1;
    o1.address1Stateorprovince = "TR";
    objects.add(o1);
    ResponseModel o2 = ResponseModel();
    o2.entityimageUrl = const AssetImage('assets/avatar.jpeg');
    o2.name = "ekmek";
    o2.accountnumber = 2;
    o2.statecode = 7;
    o2.address1Stateorprovince = "EN";
    objects.add(o2);
    objects.add(o2);
    objects.add(o1);
    objects.add(o1);
    objects.add(o1);
    objects.add(o2);
    objects.add(o1);
    objects.add(o1);
    objects.add(o1);

    return objects;
  }
}
