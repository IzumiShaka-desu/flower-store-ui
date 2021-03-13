import 'package:flutter/material.dart';

abstract class Navigation {
  static Future<T> goTo<T>(BuildContext context, Widget destination) =>
      Navigator.of(context).push<T>(
        MaterialPageRoute(
          builder: (BuildContext context) => destination,
        ),
      );
}
