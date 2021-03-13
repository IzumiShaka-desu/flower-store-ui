import 'package:flutter/material.dart';

abstract class Constants {
  static String assetImage(String imageFilename) =>
      'assets/images/$imageFilename';
  static String assetIcon(String iconFileName) => 'assets/icons/$iconFileName';
  static TextTheme textTheme(BuildContext context)=>Theme.of(context).textTheme;
}
