import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:veluv/constant/color_pallete.dart';
import 'package:veluv/constant/constant.dart';

showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: ColorPallete.primaryTextColor,
      content: Text(message ?? "",
          style: Constants.textTheme(context)
              .bodyText1
              .copyWith(color: ColorPallete.backgroundCardColor)),
    ),
  );
}
