
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:veluv/constant/color_pallete.dart';
import 'package:veluv/constant/constant.dart';
import 'package:veluv/constant/size.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeUtils.widthOnPercent(90, context),
      decoration: BoxDecoration(
        color: ColorPallete.backgroundCardColor,
        borderRadius: BorderRadius.circular(25),
      ),
      margin: EdgeInsets.only(top: 50),
      child: Material(
        borderRadius: BorderRadius.circular(25),
        elevation: 8,
        child: Center(
          child: Container(
            height: 48,
            child: Row(
              children: [
                SizedBox(
                  height: 47,
                  width: 47,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          Constants.assetImage(
                            'bg-btn.png',
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          Constants.assetIcon(
                            'search.svg',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: Constants.textTheme(context)
                            .bodyText2
                            .copyWith(color: Colors.grey),
                        hintText: '  Search your Flower..'),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: 30,
                  width: 50,
                  child: SvgPicture.asset(
                    Constants.assetIcon('microphone.svg'),
                  ),
                ),
              ],
            ),
            padding: EdgeInsets.all(1),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: ColorPallete.backgroundCardColor,
            ),
          ),
        ),
      ),
    );
  }
}
