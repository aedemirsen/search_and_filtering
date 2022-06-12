import 'package:flutter/material.dart';
import 'package:search_and_filtering/model/object.dart';

class TEST {
  static List<ObjectView> objects() {
    List<ObjectView> objects = [];
    ObjectView o1 = ObjectView();
    o1.image = const AssetImage('assets/avatar.jpeg');
    o1.title = "A";
    o1.payload = "testtesttesttes";
    objects.add(o1);
    objects.add(o1);
    objects.add(o1);
    objects.add(o1);
    objects.add(o1);
    objects.add(o1);
    objects.add(o1);
    objects.add(o1);
    objects.add(o1);
    objects.add(o1);

    return objects;
  }
}
