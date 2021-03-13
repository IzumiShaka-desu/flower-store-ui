import 'package:flutter/material.dart';

abstract class SizeUtils {
  static double widthOnPercent(double percent, BuildContext context) =>
      MediaQuery.of(context).size.width * (percent / 100);
  static double heightOnPercent(double percent, BuildContext context) =>
      MediaQuery.of(context).size.height * (percent / 100);
}
