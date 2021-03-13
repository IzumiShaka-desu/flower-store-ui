import 'package:flutter/material.dart';
import 'package:veluv/extension/color_extension.dart' as color;
abstract class ColorPallete{
  
  static final Color primaryColor=color.ColorExtension.fromHex('#e44d6e');
  static final Color primaryLightColor=color.ColorExtension.fromHex('#ff658b');
  static final Color primaryTextColor= color.ColorExtension.fromHex('#212121');
  static final Color backgroundColor=color.ColorExtension.fromHex('#fefefefe');
  static final Color backgroundCardColor=color.ColorExtension.fromHex('#ffffff');
}