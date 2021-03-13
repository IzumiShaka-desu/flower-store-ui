import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:veluv/constant/color_pallete.dart';
import 'package:veluv/constant/constant.dart';
import 'package:veluv/constant/size.dart';
import 'package:veluv/model/flower.dart';
import 'package:veluv/utils/star_list.dart';

class SavedFlowerListpage extends StatelessWidget {

  final List<Flower> flowers;
  final Function(Flower flower) onPressed;
  final String tags;
 const SavedFlowerListpage({Key key, this.flowers, this.onPressed, this.tags})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return (flowers?.length ?? 0) > 0
        ? ListView.builder(
            padding: EdgeInsets.only(left: 10, right: 10),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              if(index==flowers.length){
        return  Container(height: 100,);
        }
              return Container(
                margin: EdgeInsets.only(top: 10, bottom: 5),
                height: 130,
                width: SizeUtils.widthOnPercent(90, context),
                child: InkWell(
                  onTap: () {
                    onPressed(flowers[index]);
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Hero(
                              tag: "${flowers[index].name} $tags",
                              child: Container(
                                width: 75,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          flowers[index].image.first),
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      flowers[index].name ?? '',
                                      style: Constants.textTheme(context)
                                          .headline6
                                          .copyWith(
                                              color:
                                                  ColorPallete.primaryTextColor,
                                              fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      Constants.assetIcon('location.svg'),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      flowers[index].origin ?? '',
                                      style: Constants.textTheme(context)
                                          .bodyText1
                                          .copyWith(color: Colors.grey),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      height: 20,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children:
                                            createListStar(flowers[index].rate),
                                      ),
                                      decoration: BoxDecoration(
                                        color: ColorPallete.primaryLightColor
                                            .withOpacity(0.3),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: ColorPallete.primaryLightColor,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.arrow_forward_ios,
                                          color: ColorPallete.backgroundColor,
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 10),
                            ),
                          ),
                        ],
                      ),
                    ),
                    color: ColorPallete.backgroundCardColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
              );
            },
            itemCount:(flowers?.length??-1)+1 ?? 0,
          )
        : Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text('Sorry don\'t have saved flower '),
              ],
            ),
          );
  }
}
