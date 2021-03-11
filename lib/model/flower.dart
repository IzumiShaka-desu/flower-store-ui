import 'package:flutter/cupertino.dart';

class Flower {
  String origin;
  String name;
  String condition;
  String weight;
  String category;
  String description;
  Flower(
      {@required this.category,
      @required this.condition,
      @required this.description,
      @required this.name,
      @required this.origin,
      @required this.weight});
}
