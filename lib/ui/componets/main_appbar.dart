
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:veluv/constant/constant.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: 35,
            width: 35,
            child: SvgPicture.asset(
              Constants.assetIcon('hamburger.svg'),
            ),
          ),
          SvgPicture.asset(
            Constants.assetImage('VeluV.svg'),
          ),
          SizedBox(
            height: 30,
            width: 30,
            child: SvgPicture.asset(
              Constants.assetIcon('notif.svg'),
            ),
          ),
        ],
      ),
    );
  }
}
