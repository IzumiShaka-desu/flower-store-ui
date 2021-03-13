import 'package:flutter/cupertino.dart';

class Flower {
  String origin;
  String name;
  String condition;
  String weight;
  String category;
  String description;
  List<String> image;
  int rate;
  int price;
  Flower(
      {@required this.category,
      @required this.condition,
      @required this.description,
      @required this.name,
      @required this.origin,
      @required this.rate,
      @required this.price,
      @required this.weight,
      @required this.image});
}
