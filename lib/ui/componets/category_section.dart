import 'package:flutter/material.dart';

import '../../constant/color_pallete.dart';
import '../../constant/constant.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      margin: EdgeInsets.only(top: 20),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 7),
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(
                    colorFilter:
                        ColorFilter.mode(Colors.blueGrey, BlendMode.hardLight),
                    fit: BoxFit.cover,
                    image: AssetImage(
                      Constants.assetImage('category-01.png'),
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Indoor',
                      style: Constants.textTheme(context).headline5.copyWith(
                          color: ColorPallete.backgroundColor,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '346 Flowers',
                      style: Constants.textTheme(context).caption.copyWith(
                          color: ColorPallete.backgroundColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 15.0, left: 7),
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      Constants.assetImage('category-02.png'),
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Outdoor',
                      style: Constants.textTheme(context).headline5.copyWith(
                          color: ColorPallete.backgroundColor,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '873 Flowers',
                      style: Constants.textTheme(context).caption.copyWith(
                          color: ColorPallete.backgroundColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
