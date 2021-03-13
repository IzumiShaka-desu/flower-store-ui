
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:veluv/constant/color_pallete.dart';
import 'package:veluv/constant/constant.dart';

class NavBarMenu extends StatelessWidget {
  final String iconSvgFile;
  final VoidCallback onPressed;
    final bool isActive;
  const NavBarMenu({
    Key key,
    @required this.iconSvgFile,
    @required this.onPressed,
    this.isActive,
  })  : assert(iconSvgFile != null),
        assert(onPressed != null),
        super(key: key);



  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        child: isActive ?? false
            ? SvgPicture.asset(
                Constants.assetIcon(iconSvgFile),
                key: UniqueKey(),
                color: ColorPallete.primaryLightColor,
              )
            : SvgPicture.asset(
                Constants.assetIcon(iconSvgFile),
                key: UniqueKey(),
                color: Colors.grey[500],
              ),
      ),
    );
  }
}
