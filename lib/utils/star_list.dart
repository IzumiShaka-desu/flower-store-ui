import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constant/constant.dart';

List<Widget> createListStar(int count) => List<Widget>.generate(
    count,
    (index) => SvgPicture.asset(
      Constants.assetIcon('star.svg'),
    ),
  );

